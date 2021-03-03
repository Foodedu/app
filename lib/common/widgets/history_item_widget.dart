import 'package:flutter/material.dart';
import 'package:food/common/widgets/secondary_button_widget.dart';
import 'package:food/themes/app_colors.dart';
import 'package:food/themes/styles_text.dart';
import '../../models/order.dart';
import '../../themes/app_colors.dart';
import 'image_network_widget.dart';

class HistoryItemWidget extends StatelessWidget {
  final Order order;
  final Function onPressed;
  final Function onPressedRating;
  final Function onPressedReOrder;

  const HistoryItemWidget({
    Key key,
    @required this.order,
    @required this.onPressed,
    @required this.onPressedRating,
    @required this.onPressedReOrder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
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
        child: Column(
          children: [
            IntrinsicHeight(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  NetworkImageWidget(
                    url: order.url,
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
                          order.name,
                          style:
                              StylesText.h1.copyWith(color: AppColors.neutral1),
                          maxLines: 1,
                        ),
                        Text(
                          order.description,
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
                              '${order.hour} mins',
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
                              '${order.distance} km',
                              style: StylesText.caption
                                  .copyWith(color: AppColors.neutral1),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Expanded(child: Container()),
                            Text(
                              '\$${order.price}',
                              style: StylesText.body1.copyWith(
                                color: AppColors.neutral1,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SecondaryButtonWidget(
                    title: 'Rate',
                    onPressed: onPressedRating,
                    size: 120,
                    color: AppColors.neutral2,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  SecondaryButtonWidget(
                    title: 'Re-Order',
                    onPressed: onPressedReOrder,
                    size: 120,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
