
import 'package:get/route_manager.dart';
import '../modules/home/home_bindings.dart';
import '../modules/home/home_page.dart';

class HomeRouters {
  HomeRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: '/home', //Nome da Rota
      binding: HomeBindings(), //Efetua o binding do Controller
      page: () => const HomePage(), //Constrói a página
    )
  ];
}