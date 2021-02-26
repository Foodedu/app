import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CircleImageWidget extends StatelessWidget {
  final String url;
  final double size;
  const CircleImageWidget({@required this.url, this.size = 80});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          color: Colors.grey,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white)),
      child: CachedNetworkImage(
        imageUrl: url ?? '',
        imageBuilder: (context, imageProvider) => Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          ),
        ),
        placeholder: (context, url) => Icon(
          Icons.image,
        ),
        errorWidget: (context, url, error) => Icon(
          Icons.image,
        ),
      ),
    );
  }
}
