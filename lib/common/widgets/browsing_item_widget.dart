import 'package:flutter/material.dart';
import 'package:food/themes/app_colors.dart';
import 'package:food/themes/styles_text.dart';
import '../../models/browsing.dart';
import 'image_network_widget.dart';

class BrowsingItemWidget extends StatelessWidget {
  final Browsing browsing;
  final Function onPressed;

  const BrowsingItemWidget({
    Key key,
    @required this.browsing,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(16),
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
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  NetworkImageWidget(
                    url: browsing.url,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          browsing.name,
                          style:
                              StylesText.h2.copyWith(color: AppColors.neutral1),
                          maxLines: 1,
                        ),
                        Text(
                          browsing.address,
                          style: StylesText.caption
                              .copyWith(color: AppColors.neutral3),
                          maxLines: 1,
                        ),
                        Expanded(child: Container()),
                        Row(
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
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            child: discount(browsing.discount),
          )
        ],
      ),
    );
  }

  Widget discount(num discount) {
    if (discount <= 0) {
      return Container();
    } else {
      return Container(
        width: 56,
        height: 25,
        decoration: BoxDecoration(
          color: AppColors.semantic1,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
        ),
        child: Center(
          child: Text(
            '$discount %',
            style: StylesText.body2.copyWith(color: AppColors.white),
          ),
        ),
      );
    }
  }
}
