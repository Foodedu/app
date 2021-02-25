import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/themes/styles_text.dart';
import 'package:get/get.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final bool isShowBack;
  final void Function() onBackButtonPressed;
  final bool isShowMainAction;
  final String iconBackButton;
  final void Function() onMainActionPressed;
  const AppBarWidget({
    this.title,
    this.isShowBack = false,
    this.onBackButtonPressed,
    this.isShowMainAction = false,
    this.iconBackButton,
    this.onMainActionPressed,
  });

  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();

  @override
  Size get preferredSize => AppBar().preferredSize;
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          widget.title ?? '',
          style: StylesText.title2,
        ),
        leading: widget.isShowBack
            ? IconButton(
                icon: Icon(Icons.arrow_back_ios),
                color: Colors.black,
                onPressed: widget.onBackButtonPressed ?? onBack,
              )
            : SizedBox(),
        actions: [
          widget.isShowMainAction
              ? Container(
                  child: IconButton(
                  icon: SvgPicture.asset(widget.iconBackButton ?? ''),
                  onPressed: widget.onMainActionPressed,
                ))
              : SizedBox(),
        ],
      ),
    );
  }

  void onBack() {
    Get.back();
  }
}
