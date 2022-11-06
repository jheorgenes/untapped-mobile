import 'package:get/get.dart';
import 'package:untapped/app/core/repository/events_repository.dart';
import './create_event_controller.dart';

class CreateEventBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IEventsRepositoty>(
        () => EventsRepository(restClient: Get.find()));
    Get.put(CreateEventController(Get.find()));
  }
}
