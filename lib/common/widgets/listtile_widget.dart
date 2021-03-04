import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';
import '../../themes/styles_text.dart';

class ListTileWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onTap;

  const ListTileWidget({
    Key key,
    @required this.title,
    @required this.icon,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: ListTile(
        leading: Icon(icon),
        title: Text(
          title,
          style: StylesText.body1.copyWith(color: AppColors.neutral1),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: AppColors.primary1,
        ),
        onTap: onTap,
      ),
    );
  }
}
