import 'package:get/get.dart';
import './presentation_controller.dart';

class PresentationBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(PresentationController());
    }
}