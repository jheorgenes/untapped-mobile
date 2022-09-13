import 'package:get/get.dart';
import './events_controller.dart';

class EventsBindings implements Bindings {
  @override 
  void dependencies(){
    Get.put(EventsController());
  }
}