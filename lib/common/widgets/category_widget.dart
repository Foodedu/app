import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/themes/app_colors.dart';
import 'package:food/themes/styles_text.dart';

class CategoryWidget extends StatelessWidget {
  final String icon;
  final String label;
  final Function onPressed;
  const CategoryWidget({
    @required this.icon,
    @required this.label,
    @required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 90,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: onPressed,
            child: Container(
              width: 56,
              height: 56,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.neutral5,
                borderRadius: BorderRadius.circular(8),
              ),
              child: SvgPicture.asset(icon),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          AutoSizeText(
            label,
            style: StylesText.body2,
            maxLines: 1,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
