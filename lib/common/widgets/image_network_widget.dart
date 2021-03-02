import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NetworkImageWidget extends StatelessWidget {
  final String url;
  final double width;
  final double height;
  final BorderRadiusGeometry borderRadius;
  const NetworkImageWidget({
    @required this.url,
    this.width = 80,
    this.height = 80,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey,
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(8),
        ),
        child: CachedNetworkImage(
          imageUrl: url ?? '',
          imageBuilder: (context, imageProvider) => Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              borderRadius: borderRadius ?? BorderRadius.circular(8),
            ),
          ),
          placeholder: (context, url) => Icon(
            Icons.image,
          ),
          errorWidget: (context, url, error) => Icon(
            Icons.image,
          ),
        ));
  }
}
