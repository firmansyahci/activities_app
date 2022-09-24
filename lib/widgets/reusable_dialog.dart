import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReusableDialog {
  static void showLoading() {
    Get.dialog(
      Dialog(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              CircularProgressIndicator(),
              SizedBox(width: 24),
              Text('Loading'),
            ],
          ),
        ),
      ),
    );
  }

  static void hideLoading() {
    if (Get.isDialogOpen ?? false) Get.back();
  }
}
