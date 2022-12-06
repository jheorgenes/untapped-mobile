import 'package:get/get.dart';
import 'package:untapped/app/core/repository/events_repository.dart';
import './event_detail_controller.dart';

class EventDetailBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IEventsRepositoty>(
      () => EventsRepository(
        restClient: Get.find(),
      ),
    );
    Get.put(EventDetailController(Get.find()));
  }
}
