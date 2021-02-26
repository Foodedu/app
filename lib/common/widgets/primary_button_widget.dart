import 'package:flutter/material.dart';
import '../../themes/app_colors.dart';
import '../../themes/styles_text.dart';

class PrimaryButtonWidget extends StatelessWidget {
  final String title;
  final double size;
  final bool isEnable;
  final Function() onPressed;
  const PrimaryButtonWidget({
    @required this.title,
    @required this.onPressed,
    this.size = double.infinity,
    this.isEnable = true,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: 47,
      child: RaisedButton(
        onPressed: isEnable ? onPressed : null,
        color: AppColors.primary1,
        disabledColor: AppColors.neutral4,
        child: Text(
          title.toUpperCase(),
          style: StylesText.h2.copyWith(color: AppColors.white),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
