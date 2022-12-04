import 'package:get/get.dart';
import 'package:untapped/app/core/repository/category_repository.dart';
import './categories_controller.dart';

class CategoriesBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ICategoryRepositoty>(
        () => CategoryRepository(restClient: Get.find()));

    Get.put(CategoriesController(Get.find()));
  }
}
