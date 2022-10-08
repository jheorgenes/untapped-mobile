import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:untapped/app/app_bindings.dart';
import 'package:untapped/app/app_page.dart';
import 'package:untapped/app/routes/checkout_routes.dart';
import 'package:untapped/app/routes/event_detail_routes.dart';
import 'package:untapped/app/routes/home_routes.dart';

class AppRoutes {
  AppRoutes._(); //Chamando uma função anônima privada

  static final routes = [
    GetPage(
      name: '/',
      binding: AppBindings(),
      page: () => const AppPage(),
    ),
    ...HomeRoutes
        .routes, //Ao acessa com '/', chama esse metodo HomeRouters.routers
    ...EventDetailRoutes.routes,
    ...CheckoutRoutes.routes,
  ];
}
