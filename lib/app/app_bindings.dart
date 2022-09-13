
import 'package:get/get.dart';
import 'package:untapped/app/app_controller.dart';
//import './app_controller.dart';

class AppBindings implements Bindings {
  @override
  void dependencies(){
    Get.put(AppController());
  }
}