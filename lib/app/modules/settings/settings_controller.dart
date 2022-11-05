import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:untapped/app/core/constants/constants.dart';

class SettingsController extends GetxController {
  final _getStorage = GetStorage();

  logout() async {
    await _getStorage.write(Constants.USER_KEY, null);
    await _getStorage.remove('accessToken');
    await _getStorage.remove('refreshToken');
  }
}
