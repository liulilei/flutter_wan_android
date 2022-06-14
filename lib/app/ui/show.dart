import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

void showSnackBar(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(msg),
      duration: const Duration(seconds: 1),
    ),
  );
}

void snackBar(String title, String msg) {
  Get.snackbar(title, msg, duration: const Duration(seconds: 1));
}

Future<void> showToast(
  String? msg, {
  Duration time = const Duration(milliseconds: 1500),
  alignment = Alignment.center,
}) async {
  if (msg == null) {
    return;
  }

  SmartDialog.showToast(msg, displayTime: time, alignment: Alignment.center);
}
