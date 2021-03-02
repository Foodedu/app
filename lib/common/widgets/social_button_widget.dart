import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/utils/app_images.dart';
import '../../themes/app_colors.dart';
import '../../themes/styles_text.dart';

class SocialButtonWidget extends StatelessWidget {
  final String title;
  final double size;
  final Color backgroundColor;
  final String icon;
  final bool isEnable;
  final Function() onPressed;
  const SocialButtonWidget({
    @required this.title,
    @required this.onPressed,
    @required this.backgroundColor,
    @required this.icon,
    this.size = double.infinity,
    this.isEnable = true,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: size,
        height: 47,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: backgroundColor,
        ),
        child: Row(
          children: [
            Container(
              width: 30,
              height: 30,
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: AppColors.white,
              ),
              child: SvgPicture.asset(icon),
            ),
            Expanded(
              child: Text(
                title.toUpperCase(),
                style: StylesText.h2.copyWith(color: AppColors.white),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
