import 'package:get/get.dart';
import 'package:untapped/app/core/repository/category_repository.dart';

class CategoriesController extends GetxController {
  final ICategoryRepositoty _categoryRepositoty;

  CategoriesController(this._categoryRepositoty);
  createCategory(Map<String, dynamic> data) {
    return _categoryRepositoty.store(data);
  }
}
