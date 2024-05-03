import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogHelper {
  static void showLoading() {
    Get.dialog(Center(child: CircularProgressIndicator()), barrierDismissible: false, name: 'loading');
  }

  static void hideDialog({bool closeOverlays = false}) {
    if (Get.isDialogOpen ?? false) Get.back(closeOverlays: closeOverlays);
  }

  static bool isDialogOpen() {
    return Get.isDialogOpen ?? false;
  }
}