import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food/common/widgets/image_network_widget.dart';
import 'package:food/themes/app_colors.dart';

class SlideImageWidget extends StatefulWidget {
  final List<String> imgList;
  final double height;

  const SlideImageWidget({
    Key key,
    @required this.imgList,
    this.height = 150,
  }) : super(key: key);

  @override
  _SlideImageWidgetState createState() => _SlideImageWidgetState();
}

class _SlideImageWidgetState extends State<SlideImageWidget> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CarouselSlider(
              items: imageSliders(),
              options: CarouselOptions(
                  autoPlay: true,
                  height: widget.height,
                  enlargeCenterPage: true,
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.imgList.map((url) {
                var index = widget.imgList.indexOf(url);
                return Container(
                  width: _current == index ? 24.0 : 4.0,
                  height: 4.0,
                  margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: _current == index
                        ? AppColors.primary1
                        : AppColors.neutral3,
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> imageSliders() {
    return widget.imgList
        .map(
          (item) => NetworkImageWidget(
            url: item,
            width: 1000.0,
            height: widget.height,
          ),
        )
        .toList();
  }
}
