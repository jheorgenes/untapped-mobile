import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:untapped/app/core/widgets_ui/app_bar_navigator.dart';
import './checkout_controller.dart';

class CheckoutPage extends GetView<CheckoutController> {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarNavigator(
        title: 'Checkout',
        showIcon: false,
        color: Color(0XFF1B1E25),
      ),
      body: Container(),
    );
  }
}
