import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';
import '../../themes/styles_text.dart';
import 'dash_line_widget.dart';
import '../../models/voucher.dart';
import '../../utils/formatter.dart';

class TicketWidget extends StatelessWidget {
  final Voucher voucher;
  final double height;
  final Function onTap;

  const TicketWidget({
    this.height = 100.0,
    @required this.voucher,
    @required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
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
      child: ClipPath(
        clipper: TicketClipper(),
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          height: height,
          child: Row(
            children: [
              Expanded(
                child: firstWidget(),
              ),
              DashLineWidget(
                width: 10,
                height: height,
                color: Colors.black,
              ),
              Container(
                padding: EdgeInsets.all(8),
                width: 80,
                height: height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      'Exp.',
                      style: StylesText.h1.copyWith(color: AppColors.primary1),
                    ),
                    Expanded(child: Container()),
                    Text(
                      '${voucher.expiredTime.formatDDMM()}',
                      style: StylesText.h1.copyWith(color: AppColors.neutral1),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
          ),
        ),
      ),
    );
  }

  Widget firstWidget() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            width: 68,
            height: 68,
            decoration: BoxDecoration(
              color: AppColors.neutral2,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
                child: Text(
              '${voucher.percent ?? '0'}%',
              style: StylesText.h1.copyWith(color: AppColors.white),
            )),
          ),
          SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${voucher.title ?? ''}'),
              Text('${voucher.description ?? ''}'),
              Expanded(child: Container()),
              Text('${voucher.code ?? ''}'),
            ],
          ),
        ],
      ),
    );
  }
}

class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    var countOval = size.height ~/ 20;
    var _radius = 10.0;
    for (var i = 0; i < countOval; i++) {
      path.addOval(
        Rect.fromCircle(
          center: Offset(0.0, i * 3 * _radius + 5),
          radius: _radius,
        ),
      );
    }
    path.addOval(
      Rect.fromCircle(
        center: Offset(size.width - 80, 0.0),
        radius: _radius,
      ),
    );
    path.addOval(
      Rect.fromCircle(
        center: Offset(
          size.width - 80,
          size.height,
        ),
        radius: _radius,
      ),
    );

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
