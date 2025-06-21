import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarWidget {
  static void error(String title, String body) {
    Get.closeAllSnackbars();
    Get.snackbar(
      title,
      body,
      colorText: Colors.red.shade800,
    );
  }

  static void success(String title, String body) {
    Get.closeAllSnackbars();
    Get.snackbar(
      title,
      body,
      colorText: Colors.green.shade800,
    );
  }
}
