import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:untapped/app/core/repository/auth_repository.dart';
import 'package:untapped/app/core/rest_client/rest_client.dart';

import '../../../core/constants/constants.dart';

class LoginController extends GetxController {
  final IAuthRepository _authRepository;

  final _getStorage = GetStorage();

  LoginController(this._authRepository);
  final String welcomeMessage =
      'Welcome back to the LuotisPay application, please login using the user you already have and having day';
  var loading = false.obs;

  authenticate(Map<String, dynamic> data) async {
    var response = await _authRepository.login(data);
    var accessToken = response['accessToken'];
    RestClient restClient = Get.find();
    restClient.headersDefault['Authorization'] = 'Bearer $accessToken';
    var user = await _authRepository.me();

    await _getStorage.write('accessToken', accessToken);
    await _getStorage.write('refreshToken', response['refreshToken']);
    await _getStorage.write(Constants.USER_KEY, user['id']);
  }
}
