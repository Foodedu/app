import 'package:flutter/material.dart';

import '../../models/order.dart';
import '../../themes/app_colors.dart';
import '../../themes/styles_text.dart';
import 'image_network_widget.dart';

class OrderItemWidget extends StatelessWidget {
  final Order order;
  final Function onPressed;

  const OrderItemWidget({
    Key key,
    @required this.order,
    @required this.onPressed,
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
                        Row(
                          children: [
                            Text(
                              order.name,
                              style: StylesText.h1
                                  .copyWith(color: AppColors.neutral1),
                              maxLines: 1,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'KCal: ${order.cal}',
                              style: StylesText.body1
                                  .copyWith(color: AppColors.neutral2),
                              maxLines: 1,
                            ),
                          ],
                        ),
                        Text(
                          order.description,
                          style: StylesText.caption
                              .copyWith(color: AppColors.neutral3),
                          maxLines: 1,
                        ),
                        Expanded(child: Container()),
                        Text(
                          '\$${order.price}',
                          style: StylesText.body1
                              .copyWith(color: AppColors.semantic2),
                          maxLines: 1,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            showPreviousOrder(order.isPreviousOrder)
          ],
        ),
      ),
    );
  }

  Widget showPreviousOrder(bool isPreviousOrder) {
    if (!isPreviousOrder) {
      return Container();
    } else {
      return Container(
        padding: EdgeInsets.only(top: 4),
        child: Row(
          children: [
            Icon(Icons.check_circle_outline, color: AppColors.neutral3),
            SizedBox(
              width: 4,
            ),
            Text(
              'twice by you',
              style: StylesText.caption.copyWith(color: AppColors.neutral3),
            ),
          ],
        ),
      );
    }
  }
}
