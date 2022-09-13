import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:untapped/app/app_controller.dart';
import 'package:untapped/app/core/theme/app_theme_ui.dart';
import 'package:untapped/app/routers/app_routers.dart';

class AppPage extends GetView<AppController> {
  const AppPage({Key? key}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contrate online',
      theme: AppThemeUi.theme,
      initialRoute: '/home',
      getPages: AppRouters.routers,
    );
  }
}