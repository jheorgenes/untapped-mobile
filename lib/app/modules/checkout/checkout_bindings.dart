import 'package:get/get.dart';
import 'package:untapped/app/core/repository/order_repository.dart';
import './checkout_controller.dart';

class CheckoutBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IOrderRepository>(() => OrderRepository(Get.find()));
    Get.put(CheckoutController(Get.find(), Get.find()));
  }
}
