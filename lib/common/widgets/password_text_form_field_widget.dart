import 'package:flutter/material.dart';

enum PasswordTextFieldStatus { normal, showPassword, hidePassword, invalid }

class PasswordFormFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final Function(String) validator;
  final Function(String) onFieldSubmitted;
  final String hint;
  final String label;
  final FocusNode focusNode;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  const PasswordFormFieldWidget({
    @required this.controller,
    @required this.hint,
    @required this.label,
    this.validator,
    this.onFieldSubmitted,
    this.focusNode,
    this.keyboardType,
    this.textInputAction,
  });

  @override
  _PasswordFormFieldWidgetState createState() =>
      _PasswordFormFieldWidgetState();
}

class _PasswordFormFieldWidgetState extends State<PasswordFormFieldWidget> {
  PasswordTextFieldStatus status = PasswordTextFieldStatus.normal;
  Color _borderColor = Colors.grey;
  Widget _suffixIcon = SizedBox();
  Widget _errorMessageWidget = SizedBox();
  String _errorMessage = '';
  bool isHidePassword = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.grey),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 8, right: 8),
            decoration: BoxDecoration(
              border: Border.all(color: _borderColor),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextFormField(
              decoration: InputDecoration(
                  errorStyle: TextStyle(height: 0),
                  hintText: widget.hint,
                  labelText: widget.label,
                  suffixIcon: _suffixIcon,
                  border: InputBorder.none),
              keyboardType: widget.keyboardType ?? TextInputType.text,
              textInputAction: widget.textInputAction ?? TextInputAction.done,
              controller: widget.controller,
              focusNode: widget.focusNode,
              validator: onValidator,
              onChanged: onValidator,
              onFieldSubmitted: widget.onFieldSubmitted,
              obscureText: isHidePassword,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          _errorMessageWidget
        ],
      ),
    );
  }

  String onValidator(String value) {
    _errorMessage = widget.validator(value);
    if (_errorMessage != null) {
      status = PasswordTextFieldStatus.invalid;
    } else {
      status = PasswordTextFieldStatus.hidePassword;
    }
    setState(() {
      updateTextFormFieldState(status);
    });
    return _errorMessage;
  }

  void updateTextFormFieldState(PasswordTextFieldStatus status) {
    switch (status) {
      case PasswordTextFieldStatus.hidePassword:
        _borderColor = Colors.grey;
        _suffixIcon = IconButton(
            icon: Icon(
              Icons.visibility_off,
              color: Colors.grey,
            ),
            onPressed: () {
              setState(() {
                isHidePassword = !isHidePassword;
                updateTextFormFieldState(PasswordTextFieldStatus.showPassword);
              });
            });
        _errorMessageWidget = SizedBox();
        break;
      case PasswordTextFieldStatus.showPassword:
        _borderColor = Colors.grey;
        _suffixIcon = IconButton(
            icon: Icon(
              Icons.visibility,
              color: Colors.grey,
            ),
            onPressed: () {
              setState(() {
                isHidePassword = !isHidePassword;
                updateTextFormFieldState(PasswordTextFieldStatus.hidePassword);
              });
            });
        _errorMessageWidget = SizedBox();
        break;
      case PasswordTextFieldStatus.invalid:
        _borderColor = Colors.red;
        _suffixIcon = Icon(
          Icons.close,
          color: Colors.red,
        );
        _errorMessageWidget = Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8),
          child: Text(
            _errorMessage ?? '',
            style: TextStyle(color: Colors.red),
          ),
        );
        break;
      default:
        _borderColor = Colors.grey;
        _suffixIcon = SizedBox();
        _errorMessageWidget = SizedBox();
    }
  }
}
