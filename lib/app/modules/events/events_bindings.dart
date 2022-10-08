import 'package:get/get.dart';
import 'package:untapped/app/core/repository/events_repository.dart';
import './events_controller.dart';

class EventsBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IEventsRepositoty>(
        () => EventsRepository(restClient: Get.find()));
    Get.put(EventsController(eventsRepository: Get.find()));
  }
}
