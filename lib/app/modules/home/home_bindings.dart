

import 'package:get/get.dart';
import 'package:untapped/app/modules/home/home_controller.dart';

class HomeBindings implements Bindings {
  @override 
  void dependencies() {
    Get.put(HomeController());
  }
}