import 'package:get/get.dart';
import 'package:untapped/app/core/repository/events_repository.dart';
import 'package:untapped/app/core/repository/order_repository.dart';
import './tickets_controller.dart';

class TicketsBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IOrderRepository>(
      () => OrderRepository(
        Get.find(),
      ),
    );
    Get.lazyPut<IEventsRepositoty>(
      () => EventsRepository(
        restClient: Get.find(),
      ),
    );
    Get.put(TicketsController(
      Get.find(),
      Get.find(),
    ));
  }
}
