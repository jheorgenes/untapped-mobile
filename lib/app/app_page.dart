import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:untapped/app/routes/app_routes.dart';
import 'app_controller.dart';
import 'core/bindings/application_binding.dart';
import 'core/theme/app_theme_ui.dart';

class AppPage extends GetView<AppController> {
  const AppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [Locale('pt', 'BR')],
      debugShowCheckedModeBanner: false,
      title: 'Contrate online',
      theme: AppThemeUi.theme, //Tema importado manualmente
      initialRoute: '/',
      getPages: AppRoutes.routes,
      initialBinding: ApplicationBinding(),
    );
  }
}
