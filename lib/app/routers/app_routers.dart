
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:untapped/app/app_bindings.dart';
import 'package:untapped/app/app_page.dart';

import 'home_routers.dart';

class AppRouters {
  AppRouters._(); //Chamando uma função anônima privada

  static final routers = [
    GetPage(
      name: '/',
      binding: AppBindings(),
      page: () => const AppPage(),
    ),
    ...HomeRouters.routers, //Ao acessa com '/', chama esse metodo HomeRouters.routers
  ];
}