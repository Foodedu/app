import 'package:flutter/material.dart';

import '../../models/browsing.dart';
import '../../themes/app_colors.dart';
import '../../themes/styles_text.dart';
import 'image_network_widget.dart';

class RestaurantItemWidget extends StatelessWidget {
  final Browsing browsing;
  final Function onPressed;

  const RestaurantItemWidget({
    Key key,
    @required this.browsing,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 240,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: IntrinsicHeight(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              NetworkImageWidget(
                url: browsing.url,
                width: double.infinity,
                height: 104,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 4),
                child: Text(
                  browsing.name,
                  style: StylesText.h1.copyWith(color: AppColors.neutral1),
                  maxLines: 1,
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 4),
                child: Text(
                  browsing.address,
                  style: StylesText.caption.copyWith(color: AppColors.neutral3),
                  maxLines: 1,
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 4),
                child: Row(
                  children: [
                    Icon(
                      Icons.alarm,
                      color: AppColors.neutral1,
                    ),
                    Text(
                      '${browsing.hour} mins',
                      style: StylesText.caption
                          .copyWith(color: AppColors.neutral1),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(
                      Icons.time_to_leave,
                      color: AppColors.neutral1,
                    ),
                    Text(
                      '${browsing.distance} km',
                      style: StylesText.caption
                          .copyWith(color: AppColors.neutral1),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Text(
                      '${browsing.rating}',
                      style: StylesText.caption
                          .copyWith(color: AppColors.neutral1),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
