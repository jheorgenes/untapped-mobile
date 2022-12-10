import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:untapped/app/modules/qr_reader/qr_reader_bindings.dart';
import 'package:untapped/app/modules/qr_reader/qr_reader_page.dart';
import 'package:untapped/app/modules/splash/splash_bindings.dart';
import 'package:untapped/app/modules/splash/splash_page.dart';
import 'package:untapped/app/routes/auth_routes.dart';
import 'package:untapped/app/routes/checkout_routes.dart';
import 'package:untapped/app/routes/event_routes.dart';
import 'package:untapped/app/routes/home_routes.dart';

class AppRoutes {
  AppRoutes._(); //Chamando uma função anônima privada

  static final routes = [
    GetPage(
      name: '/',
      binding: SplashBindings(),
      page: () => const SplashPage(),
    ),
    GetPage(
      name: '/qr_reader',
      binding: QrReaderBindings(),
      page: () => const QrReaderPage(),
    ),
    ...AuthRoutes.routes,
    ...HomeRoutes
        .routes, //Ao acessa com '/', chama esse metodo HomeRouters.routers
    ...EventRoutes.routes,
    ...CheckoutRoutes.routes,
  ];
}
