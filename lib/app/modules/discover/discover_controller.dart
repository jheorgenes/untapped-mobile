
import 'package:get/get.dart';

class DiscoverController extends GetxController {
  final _isNow = true.obs;

  bool get isNow => _isNow.value;

  set isNow(bool value) {
    _isNow.value = value;
  }
}