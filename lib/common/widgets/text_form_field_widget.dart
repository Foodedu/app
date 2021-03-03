import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';
import '../../themes/styles_text.dart';

enum TextFieldStatus { normal, valid, invalid }

class TextFormFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final Function(String) onFieldSubmitted;
  final Function(String) validator;
  final String hint;
  final FocusNode focusNode;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  const TextFormFieldWidget({
    @required this.controller,
    @required this.hint,
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
                  hintStyle:
                      StylesText.body1.copyWith(color: AppColors.neutral2),
                  labelText: widget.hint,
                  suffixIcon: _suffixIcon,
                  border: InputBorder.none),
              style: StylesText.body1.copyWith(color: AppColors.neutral1),
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
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Text(
              _errorMessage ?? '',
              style: TextStyle(color: AppColors.semantic2),
            ),
          )
        ],
      ),
    );
  }

  String onValidator(String value) {
    if (widget.validator == null) return null;
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
        break;
      case TextFieldStatus.invalid:
        _borderColor = AppColors.semantic2;
        _suffixIcon = Icon(
          Icons.close,
          color: AppColors.semantic2,
        );
        break;
      default:
        _borderColor = AppColors.neutral4;
        _suffixIcon = SizedBox();
    }
  }
}
