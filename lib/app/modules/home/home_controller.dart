import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untapped/app/core/services/auth_service.dart';
import 'package:untapped/app/modules/dashboard/dashboard_bindings.dart';
import 'package:untapped/app/modules/dashboard/dashboard_page.dart';
import 'package:untapped/app/modules/discover/discover_bindings.dart';
import 'package:untapped/app/modules/discover/discover_page.dart';
import 'package:untapped/app/modules/events/events_bindings.dart';
import 'package:untapped/app/modules/events/events_page.dart';
import 'package:untapped/app/modules/settings/settings_bindings.dart';
import 'package:untapped/app/modules/settings/settings_page.dart';
import 'package:untapped/app/modules/tickets/tickets_bindings.dart';
import 'package:untapped/app/modules/tickets/tickets_page.dart';

class HomeController extends GetxController {
  final AuthService authService;
  HomeController(this.authService);

  static const NAVIGATOR_KEY = 1;

  final _routes = [
    '/events',
    '/dashboard',
    '/discover',
    '/tickets',
    '/profile',
  ];
  final title = 'Untapped'.obs;
  final _activeIndex = 0.obs;
  int get activeIndex => _activeIndex.value;
  var user = {}.obs;
  get routes => _routes;

  set activeIndex(int index) {
    _activeIndex(index); //Pega o indice atual

    switch (routes[index]) {
      case '/events':
        title('Untapped');
        break;
      case '/dashboard':
        title('Dashboard');
        break;
      case '/discover':
        title('Explorar Eventos');
        break;
      case '/tickets':
        title('Tickets');
        break;
      case '/profile':
        title('Settings');
        break;
    }

    Get.toNamed(_routes[index],
        id: NAVIGATOR_KEY); //Chama o get, obtendo o nome da rota com o index obtido e o id definido
  }

  Route? onGenerateRoute(RouteSettings settings) {
    //Método para gerar rotas e chamar as Pages definidas para cada rota
    log(settings.name ?? 'null');

    if (settings.name == '/events') {
      return GetPageRoute(
        settings: settings,
        page: () => const EventsPage(),
        binding: EventsBindings(),
        transition: Transition.fadeIn,
      );
    }

    if (settings.name == '/discover') {
      return GetPageRoute(
        settings: settings,
        page: () => const DiscoverPage(),
        binding: DiscoverBindings(),
        transition: Transition.fadeIn,
      );
    }

    if (settings.name == '/dashboard') {
      return GetPageRoute(
        settings: settings,
        page: () => const DashboardPage(),
        binding: DashboardBindings(),
        transition: Transition.fadeIn,
      );
    }

    if (settings.name == '/tickets') {
      return GetPageRoute(
        settings: settings,
        page: () => const TicketsPage(),
        binding: TicketsBindings(),
        transition: Transition.fadeIn,
      );
    }

    if (settings.name == '/profile') {
      return GetPageRoute(
        settings: settings,
        page: () => const SettingsPage(),
        binding: SettingsBindings(),
        transition: Transition.fadeIn,
      );
    }

    return null;
  }

  isShow(List permissions) {
    var result =
        permissions.contains('ADMIN') || permissions.contains('MANAGER');

    if (!result) {
      _routes.remove('/dashboard');
    }
    return result;
  }
}
