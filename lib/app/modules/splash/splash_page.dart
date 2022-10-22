import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untapped/app/modules/splash/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      controller.checkLogged();
    });
    return Scaffold(
      backgroundColor: const Color(0XFF1B1E25),
      body: Column(
        children: [
          const Spacer(),
          Center(child: Image.asset('assets/images/logo.png')),
          const Spacer(),
          const Center(
            child: Text(
              'Version: 1.0.0.',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(
            height: 35,
          ),
        ],
      ),
    );
  }
}
