import 'package:get/get.dart';
import '../../core/repository/events_repository.dart';
import './manager_events_controller.dart';

class ManagerEventsBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IEventsRepositoty>(
        () => EventsRepository(restClient: Get.find()));
    Get.put(
      ManagerEventsController(
        Get.find(),
        Get.find(),
      ),
    );
  }
}
