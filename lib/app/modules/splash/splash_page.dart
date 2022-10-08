
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untapped/app/modules/splash/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SplashPage'),),
      body: Container(),
    );
  }
}