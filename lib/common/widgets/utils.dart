import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class UtilWidget {
  static void showLoading() {
    if (Get.isDialogOpen) Get.back();
    Get.dialog(
        Opacity(
            opacity: 1,
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(16.0))),
                      width: 80.0,
                      height: 80.0),
                ),
                Container(
                  alignment: Alignment.center,
                  child: SizedBox(
                    child: CircularProgressIndicator(
                      strokeWidth: 2.0,
                    ),
                    width: 60.0,
                    height: 60.0,
                  ),
                )
              ],
            )),
        barrierDismissible: false);
  }

  static void hideLoading() {
    if (Get.isDialogOpen) Get.back();
  }

  static void showToastSuccess({@required String message}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static void showToastError({@required String message}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static void showToastWarning({@required String message}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.yellow,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
