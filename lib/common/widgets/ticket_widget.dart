import 'package:flutter/material.dart';
import 'package:food/common/widgets/dash_line_widget.dart';
import 'package:food/themes/app_colors.dart';
import 'package:food/themes/styles_text.dart';

class TicketWidget extends StatefulWidget {
  final double width;
  final double height;
  final Widget child;
  final Color color;
  final bool isCornerRounded;

  TicketWidget(
      {@required this.width,
      @required this.height,
      @required this.child,
      this.color = Colors.white,
      this.isCornerRounded = false});

  @override
  _TicketWidgetState createState() => _TicketWidgetState();
}

class _TicketWidgetState extends State<TicketWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TicketClipper(),
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        width: widget.width,
        height: widget.height,
        child: Row(
          children: [
            Expanded(
              child: firstWidget(),
            ),
            DashLineWidget(
              width: 10,
              height: widget.height,
              color: Colors.black,
            ),
            Container(
              padding: EdgeInsets.all(8),
              width: 80,
              height: widget.height,
              decoration: BoxDecoration(
                color: widget.color,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'Exp.',
                    style: StylesText.h1.copyWith(color: AppColors.semantic2),
                  ),
                  Expanded(child: Container()),
                  Text(
                    '07',
                    style: StylesText.h1.copyWith(color: AppColors.neutral1),
                  ),
                  Text(
                    'DEC',
                    style: StylesText.h1.copyWith(color: AppColors.neutral1),
                  ),
                ],
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(8),
            bottomRight: Radius.circular(8),
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
            child: Center(child: Text('50%')),
          ),
          SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Black fries day'),
              Text('All black fries'),
              Expanded(child: Container()),
              Text('BLFD 30'),
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
