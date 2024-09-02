import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/text_styles.dart';

class SnackBars {
  static void showSuccess(message) {
    Get.rawSnackbar(
      snackPosition: SnackPosition.BOTTOM,
        padding: const EdgeInsets.symmetric(vertical: 15),
        messageText: Text(
          message,
          style: UITextStyle.titleBold,
          textAlign: TextAlign.center,
        ),
        backgroundColor: UIColors.success);
  }

  static void showError(message) {
    Get.rawSnackbar(
        snackPosition: SnackPosition.BOTTOM,
        padding: const EdgeInsets.symmetric(vertical: 15),
        messageText: Text(
          message,
          style: UITextStyle.titleBold,
          textAlign: TextAlign.center,
        ),
        backgroundColor: UIColors.error);
  }

  static void showWarning(message) {
    Get.rawSnackbar(
        padding: const EdgeInsets.symmetric(vertical: 15),
        messageText: Text(
          message,
          style: UITextStyle.titleBold,
          textAlign: TextAlign.center,
        ),
        backgroundColor: UIColors.error);
  }
}