import 'package:get/get.dart';
import 'package:untapped/app/core/repository/category_repository.dart';
import 'package:untapped/app/modules/discover/discover_controller.dart';

class DiscoverBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ICategoryRepositoty>(
        () => CategoryRepository(restClient: Get.find()));
    Get.put(DiscoverController(Get.find()));
  }
}
