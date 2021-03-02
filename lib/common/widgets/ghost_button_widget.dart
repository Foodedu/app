import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';
import '../../themes/styles_text.dart';

class GhostButtonWidget extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final Color color;
  const GhostButtonWidget({
    @required this.title,
    @required this.onPressed,
    this.color,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Text(
        title,
        style: StylesText.h2.copyWith(color: color ?? AppColors.primary1),
      ),
    );
  }
}
