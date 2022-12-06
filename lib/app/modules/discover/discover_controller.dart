import 'package:get/get.dart';
import 'package:untapped/app/core/repository/category_repository.dart';

class DiscoverController extends GetxController {
  final _isNow = true.obs;
  final ICategoryRepositoty _categoryRepositoty;

  DiscoverController(
    this._categoryRepositoty,
  );

  bool get isNow => _isNow.value;

  set isNow(bool value) {
    _isNow.value = value;
  }

  loadCategories() async {
    var result = await _categoryRepositoty.list();
    return result;
  }
}
