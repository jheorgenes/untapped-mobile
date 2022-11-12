import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin LoaderMixin on GetxController {
  void loaderListener(RxBool loading) {
    ever(loading, (_) async {
      if (loading.isTrue) {
        await Get.dialog(
          Material(
            child: WillPopScope(
              onWillPop: () async => false,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
          barrierDismissible: false,
        );
      } else {
        Get.back();
      }
    });
  }

  void modalConfirm(RxBool modal, String message) {
    ever(modal, (_) async {
      if (modal.isTrue) {
        await Get.dialog(
          SizedBox(
            width: double.infinity,
            height: 200,
            child: Material(
              child: WillPopScope(
                onWillPop: () async => false,
                child: Center(
                  child: Text(message),
                ),
              ),
            ),
          ),
          barrierDismissible: false,
        );
      } else {
        Get.back();
      }
    });
  }
}
