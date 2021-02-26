import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';

enum PasswordTextFieldStatus { normal, showPassword, hidePassword, invalid }

class PasswordFormFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final Function(String) validator;
  final Function(String) onFieldSubmitted;
  final String hint;
  final FocusNode focusNode;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  const PasswordFormFieldWidget({
    @required this.controller,
    @required this.hint,
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
  Color _borderColor = AppColors.neutral4;
  Widget _suffixIcon = SizedBox();
  Widget _errorMessageWidget = SizedBox();
  String _errorMessage = '';
  bool isHidePassword = true;
  bool _isChangeLabelColor = false;
  FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _isChangeLabelColor = _focusNode.hasFocus ? true : false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        inputDecorationTheme: _isChangeLabelColor
            ? InputDecorationTheme(
                labelStyle: TextStyle(color: AppColors.neutral2),
              )
            : InputDecorationTheme(
                labelStyle: TextStyle(color: AppColors.neutral4),
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
                  errorStyle: TextStyle(fontSize: 0, height: 0),
                  hintText: widget.hint,
                  labelText: widget.hint,
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
        _borderColor = AppColors.neutral4;
        _suffixIcon = IconButton(
            icon: Icon(
              Icons.visibility_off,
              color: AppColors.neutral4,
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
        _borderColor = AppColors.neutral4;
        _suffixIcon = IconButton(
            icon: Icon(
              Icons.visibility,
              color: AppColors.neutral4,
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
        _borderColor = AppColors.semantic2;
        _suffixIcon = Icon(
          Icons.close,
          color: AppColors.semantic2,
        );
        _errorMessageWidget = Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8),
          child: Text(
            _errorMessage ?? '',
            style: TextStyle(color: AppColors.semantic2),
          ),
        );
        break;
      default:
        _borderColor = AppColors.neutral4;
        _suffixIcon = SizedBox();
        _errorMessageWidget = SizedBox();
    }
  }
}
