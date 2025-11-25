import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackBar {
  static Duration get snakbarDuration => const Duration(seconds: 3);

  static showCustomSnackBar({required String title, required String message}) {
    Get.snackbar(
      title,
      message,
      duration: snakbarDuration,
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      colorText: Colors.white,
      backgroundColor: Colors.green,
      icon: const Icon(
        Icons.check_circle,
        color: Colors.white,
      ),
    );
  }

  static showCustomErrorSnackBar(
      {required String title,
      required String message,
      Color? color,
      Duration? duration}) {
    Get.snackbar(
      title,
      message,
      duration: snakbarDuration,
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      colorText: Colors.white,
      backgroundColor: color ?? Colors.redAccent,
      icon: const Icon(
        Icons.error,
        color: Colors.white,
      ),
    );
  }

  static showCustomToast(
      {String? title,
      required String message,
      Color? color,
      Duration? duration}) {
    Get.rawSnackbar(
      title: title,
      duration: snakbarDuration,
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.TOP,
      backgroundColor: color ?? Colors.green,
      onTap: (snack) {
        Get.closeAllSnackbars();
      },
      //overlayBlur: 0.8,
      message: message,
    );
  }

  static showCustomErrorToast(
      {String? title,
      required String message,
      Color? color,
      Duration? duration}) {
    Get.rawSnackbar(
      title: title,
      duration: snakbarDuration,
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.TOP,
      backgroundColor: color ?? Colors.redAccent,
      onTap: (snack) {
        Get.closeAllSnackbars();
      },
      //overlayBlur: 0.8,
      message: message,
    );
  }
}
