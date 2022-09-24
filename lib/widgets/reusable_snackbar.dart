import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReusableSnackbar {
  static void error(String message) {
    Get.snackbar('Error', message,
        backgroundColor: Colors.red, colorText: Colors.white);
  }

  static void succes(String message) {
    Get.snackbar('Success', message,
        backgroundColor: Colors.green, colorText: Colors.white);
  }
}
