import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../utils/app_images.dart';

class CircleImageWidget extends StatelessWidget {
  final bool isServerFile;
  final String url;
  final double size;
  const CircleImageWidget({
    @required this.url,
    @required this.isServerFile,
    this.size = 80,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          color: Colors.grey,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white)),
      child: isServerFile
          ? CachedNetworkImage(
              imageUrl: url ?? '',
              imageBuilder: (context, imageProvider) => Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
              ),
              placeholder: (context, url) => Icon(
                Icons.image,
              ),
              errorWidget: (context, url, error) => Icon(
                Icons.image,
              ),
            )
          : loadLocalImage(url),
    );
  }

  Widget loadLocalImage(url) {
    if (url != null) {
      return ClipRRect(
          child: CircleAvatar(
        backgroundImage: FileImage(File(url)),
        radius: size / 2,
      ));
    } else {
      return ClipRRect(
          child: CircleAvatar(
        backgroundImage: AssetImage(AppImage.avatar),
        radius: size / 2,
      ));
    }
  }
}
