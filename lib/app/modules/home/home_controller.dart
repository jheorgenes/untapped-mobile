import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untapped/app/modules/discover/discover_bindings.dart';
import 'package:untapped/app/modules/discover/discover_page.dart';
import 'package:untapped/app/modules/events/events_bindings.dart';
import 'package:untapped/app/modules/events/events_page.dart';

class HomeController extends GetxController {
  static const NAVIGATOR_KEY = 1;

  final _routes = [
    '/events',
    '/discover',
  ];

  final _activeIndex = 0.obs;

  int get activeIndex => _activeIndex.value;

  set activeIndex(int index){
    _activeIndex(index); //Pega o indice atual

    Get.toNamed(_routes[index], id: NAVIGATOR_KEY); //Chama o get, obtendo o nome da rota com o index obtido e o id definido
  }

  Route? onGenerateRoute(RouteSettings settings) { //Método para gerar rotas e chamar as Pages definidas para cada rota
    log(settings.name ?? 'null');

    if(settings.name == '/events') {
      return GetPageRoute(
        settings: settings,
        page: () => const EventsPage(),
        binding: EventsBindings(),
        transition: Transition.fadeIn,
      );
    }

    if(settings.name == '/discover') {
      return GetPageRoute(
        settings: settings,
        page: () => const DiscoverPage(),
        binding: DiscoverBindings(),
        transition: Transition.fadeIn,
      );
    }

    return null;
  }
}