import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';
import '../../themes/styles_text.dart';

class SearchWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final Function(String) onChanged;
  const SearchWidget({
    @required this.controller,
    @required this.hint,
    @required this.onChanged,
  });
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: AppColors.neutral4,
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: AppColors.neutral4),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(width: 0.35),
          ),
        ),
      ),
      child: Container(
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(2),
            hintText: hint,
            hintStyle: StylesText.body2.copyWith(
              color: AppColors.neutral3,
            ),
            labelStyle: StylesText.body2,
            fillColor: AppColors.neutral5,
            filled: true,
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onChanged: onChanged,
          maxLines: 1,
        ),
      ),
    );
  }
}
