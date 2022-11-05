import 'package:get/get.dart';
import './tickets_controller.dart';

class TicketsBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(TicketsController());
    }
}