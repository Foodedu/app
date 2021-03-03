import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../common/widgets/utils.dart';
import '../../../themes/app_colors.dart';
import '../../../utils/app_images.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../common/widgets/circle_image_widget.dart';

class AvatarProfileWidget extends StatefulWidget {
  @override
  _AvatarProfileWidgetState createState() => _AvatarProfileWidgetState();
}

class _AvatarProfileWidgetState extends State<AvatarProfileWidget> {
  PickedFile _imageFile;
  bool isVideo = false;

  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Platform.isAndroid
          ? FutureBuilder<void>(
              future: retrieveLostData(),
              builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    break;
                  case ConnectionState.done:
                    return _previewImage();
                  default:
                    if (snapshot.hasError) {
                      UtilWidget.showToastError(
                          message:
                              'Pick image/video error: ${snapshot.error}}');
                      break;
                    } else {
                      UtilWidget.showToastError(
                          message: 'You have not yet picked an image.');

                      break;
                    }
                }
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      120,
                    ),
                    color: AppColors.white,
                  ),
                );
              },
            )
          : _previewImage(),
    );
  }

  void _onImageButtonPressed(ImageSource source, {BuildContext context}) async {
    try {
      final pickedFile = await _picker.getImage(
        source: source,
      );
      setState(() {
        _imageFile = pickedFile;
      });
    } catch (e) {
      print(e);
    }
  }

  Widget _previewImage() {
    return Center(
      child: Stack(children: [
        CircleImageWidget(
          isServerFile: false,
          size: 120,
          url: _imageFile?.path,
        ),
        Positioned(
          bottom: 4,
          right: 4,
          child: InkWell(
            onTap: () {
              _showDialogPickImage();
            },
            child: Container(
              width: 35,
              height: 35,
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: AppColors.primary1,
                borderRadius: BorderRadius.circular(35),
              ),
              child: SvgPicture.asset(
                AppIcon.icCameraPicker,
              ),
            ),
          ),
        )
      ]),
    );
  }

  void _showDialogPickImage() {
    Get.bottomSheet(Container(
      color: Colors.white,
      child: Wrap(
        children: [
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: Text(
              'Take a Photo',
            ),
            onTap: () {
              Get.back();
              _onImageButtonPressed(ImageSource.camera, context: context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: Text(
              'Pick Image from gallery',
            ),
            onTap: () {
              Get.back();
              _onImageButtonPressed(ImageSource.gallery, context: context);
            },
          )
        ],
      ),
    ));
  }

  Future<void> retrieveLostData() async {
    final response = await _picker.getLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      setState(() {
        _imageFile = response.file;
      });
    } else {
      print(response.exception.code);
    }
  }
}
