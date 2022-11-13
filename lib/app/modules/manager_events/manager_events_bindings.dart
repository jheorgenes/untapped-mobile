import 'package:get/get.dart';
import './manager_events_controller.dart';

class ManagerEventsBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(ManagerEventsController());
    }
}