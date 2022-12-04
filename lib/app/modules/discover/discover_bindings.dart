import 'package:get/get.dart';
import 'package:untapped/app/core/repository/category_repository.dart';

class DiscoverBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ICategoryRepositoty>(
        () => CategoryRepository(restClient: Get.find()));
    Get.put(CategoryRepository(restClient: Get.find()));
  }
}
