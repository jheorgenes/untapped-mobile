import 'package:get/get.dart';
import './checkout_controller.dart';

class CheckoutBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(CheckoutController());
    }
}