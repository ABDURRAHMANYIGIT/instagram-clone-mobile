import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/styles/colors.dart';
import 'common_dialog.dart';

void showMessageDialog({
  required String title,
  required String body,
  VoidCallback? onConfirm,
  VoidCallback? onCancel,
  bool dismissible = true,
  String? toRouteOnConfirm,
  String? confirmButtonText,
  Map<String, String>? toRouteOnConfirmArguments,
}) {
  showCommonDialog(
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: AppColors.grey,
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: Text(
        body,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: AppColors.grey,
          fontSize: 16,
        ),
      ),
      onConfirm: onConfirm == null
          ? () {
              Get.back();
              if (toRouteOnConfirm != null) {
                Get.toNamed(toRouteOnConfirm,
                    parameters: toRouteOnConfirmArguments);
              }
            }
          : () {
              onConfirm();
              Get.back();
              if (toRouteOnConfirm != null) {
                Get.toNamed(toRouteOnConfirm,
                    parameters: toRouteOnConfirmArguments);
              }
            },
      onCancel: onCancel != null
          ? () {
              onCancel();
              Get.back();
            }
          : null,
      dismissable: dismissible,
      dialogName: title,
      confirmButtonText: confirmButtonText ?? 'OK');
}
