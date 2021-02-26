import 'package:flutter/material.dart';
import 'package:food/themes/app_colors.dart';

enum TextFieldStatus { normal, valid, invalid }

class TextFormFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final Function(String) onFieldSubmitted;
  final Function(String) validator;
  final String hint;
  final String label;
  final FocusNode focusNode;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  const TextFormFieldWidget({
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
  _TextFormFieldWidgetState createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  TextFieldStatus status = TextFieldStatus.normal;
  Color _borderColor = AppColors.neutral4;
  Widget _suffixIcon = SizedBox();
  Widget _errorMessageWidget = SizedBox();
  String _errorMessage = '';
  FocusNode _focusNode;
  bool _isChangeLabelColor = false;

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
                  labelText: widget.label,
                  suffixIcon: _suffixIcon,
                  border: InputBorder.none),
              keyboardType: widget.keyboardType ?? TextInputType.text,
              textInputAction: widget.textInputAction ?? TextInputAction.done,
              controller: widget.controller,
              focusNode: _focusNode,
              validator: onValidator,
              onChanged: onValidator,
              onFieldSubmitted: widget.onFieldSubmitted,
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
      status = TextFieldStatus.invalid;
    } else {
      status = TextFieldStatus.valid;
    }
    setState(() {
      updateTextFormFieldState(status);
    });
    return _errorMessage;
  }

  void updateTextFormFieldState(TextFieldStatus status) {
    switch (status) {
      case TextFieldStatus.valid:
        _borderColor = AppColors.semantic1;
        _suffixIcon = Icon(Icons.check);
        _errorMessageWidget = SizedBox();
        break;
      case TextFieldStatus.invalid:
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
