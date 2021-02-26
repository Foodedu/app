import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';
import '../../themes/styles_text.dart';

class SecondaryButtonWidget extends StatelessWidget {
  final String title;
  final double size;
  final Function() onPressed;
  const SecondaryButtonWidget({
    @required this.title,
    @required this.onPressed,
    this.size = double.infinity,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: 47,
      child: OutlineButton(
        onPressed: onPressed,
        color: AppColors.primary1,
        child: Text(
          title.toUpperCase(),
          style: StylesText.h2.copyWith(color: AppColors.primary1),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        borderSide: BorderSide(
          color: AppColors.primary1,
          width: 1,
          style: BorderStyle.solid,
        ),
      ),
    );
  }
}
