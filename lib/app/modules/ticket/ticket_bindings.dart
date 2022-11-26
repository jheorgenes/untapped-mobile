import 'package:get/get.dart';
import 'package:untapped/app/core/repository/events_repository.dart';
import './ticket_controller.dart';

class TicketBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IEventsRepositoty>(
      () => EventsRepository(
        restClient: Get.find(),
      ),
    );
    Get.put(
      TicketController(Get.find()),
    );
  }
}
