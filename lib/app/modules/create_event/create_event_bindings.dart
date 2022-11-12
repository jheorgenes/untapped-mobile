import 'package:get/get.dart';
import 'package:untapped/app/core/repository/events_repository.dart';
import 'package:untapped/app/core/repository/files_repository.dart';
import 'package:untapped/app/core/repository/via_cep_repository.dart';
import './create_event_controller.dart';

class CreateEventBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IViaCepRepository>(() => ViaCepRepository());
    Get.lazyPut<IEventsRepositoty>(
        () => EventsRepository(restClient: Get.find()));
    Get.lazyPut<IFilesRepositoty>(
        () => FilesRepository(restClient: Get.find()));
    Get.put(
      CreateEventController(
        Get.find(),
        Get.find(),
        Get.find(),
      ),
    );
  }
}
