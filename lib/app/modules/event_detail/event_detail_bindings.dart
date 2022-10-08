import 'package:get/get.dart';
import './event_detail_controller.dart';

class EventDetailBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(EventDetailController());
    }
}