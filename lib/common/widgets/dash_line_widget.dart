import 'package:flutter/material.dart';

class DashLineWidget extends StatelessWidget {
  final double width;
  final double height;
  final Color color;

  const DashLineWidget(
      {this.width = 5, @required this.height, this.color = Colors.black});
  @override
  Widget build(BuildContext context) {
    var countDash = height ~/ 2;
    return Container(
        width: 2,
        height: height,
        child: ListView.separated(
            itemBuilder: (context, index) {
              return SizedBox(
                height: 5,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.grey),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 2,
              );
            },
            itemCount: countDash));
  }
}
