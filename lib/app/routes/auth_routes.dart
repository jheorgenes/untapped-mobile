import 'package:get/route_manager.dart';
import 'package:untapped/app/modules/auth/login/login_bindings.dart';
import 'package:untapped/app/modules/auth/login/login_page.dart';
import 'package:untapped/app/modules/auth/presentation/presentation_bindings.dart';
import 'package:untapped/app/modules/auth/presentation/presentation_page.dart';
import 'package:untapped/app/modules/auth/register/register_bindings.dart';
import 'package:untapped/app/modules/auth/register/register_page.dart';
import 'package:untapped/app/modules/profile/profile_bindings.dart';
import 'package:untapped/app/modules/profile/profile_page.dart';

class AuthRoutes {
  AuthRoutes._();

  static final routes = <GetPage>[
    GetPage(
      name: '/auth/presentation', //Nome da Rota
      binding: PresentationBindings(), //Efetua o binding do Controller
      page: () => const PresentationPage(), //Constrói a página
    ),
    GetPage(
      name: '/auth/login', //Nome da Rota
      binding: LoginBindings(), //Efetua o binding do Controller
      page: () => LoginPage(), //Constrói a página
    ),
    GetPage(
      name: '/auth/register', //Nome da Rota
      binding: RegisterBindings(), //Efetua o binding do Controller
      page: () => RegisterPage(), //Constrói a página
    ),
    GetPage(
      name: '/profile', //Nome da Rota
      binding: ProfileBindings(), //Efetua o binding do Controller
      page: () => ProfilePage(), //Constrói a página
    )
  ];
}
