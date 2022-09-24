import 'package:activities_app/consts/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReusableBottomSheet {
  static void show(Widget widget) {
    Get.bottomSheet(
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 16),
            decoration: const BoxDecoration(
              color: AppColors.grey,
              borderRadius: BorderRadius.all(Radius.circular(3)),
            ),
            height: 5,
            width: 110,
          ),
          widget
        ],
      ),
      backgroundColor: AppColors.white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
    );
  }
}
