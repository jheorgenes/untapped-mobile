import 'package:get/get.dart';
import './ticket_controller.dart';

class TicketBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(TicketController());
    }
}