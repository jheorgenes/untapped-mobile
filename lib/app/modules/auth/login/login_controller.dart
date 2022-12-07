import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:untapped/app/core/repository/auth_repository.dart';
import 'package:untapped/app/core/rest_client/rest_client.dart';
import 'package:untapped/app/core/services/auth_service.dart';

import '../../../core/constants/constants.dart';

class LoginController extends GetxController {
  final IAuthRepository _authRepository;
  final AuthService _authService = Get.find();

  final _getStorage = GetStorage();

  LoginController(this._authRepository);
  final String welcomeMessage =
      'Welcome back to the LuotisPay application, please login using the user you already have and having day';
  var loading = false.obs;

  authenticate(Map<String, dynamic> data) async {
    RestClient restClient = Get.find();
    await _getStorage.write(Constants.USER_KEY, null);
    restClient.headersDefault['Authorization'] = '';
    var response = await _authRepository.login(data);

    var accessToken = response?['accessToken'];

    restClient.headersDefault['Authorization'] = 'Bearer $accessToken';

    await _getStorage.write('accessToken', accessToken);
    await _getStorage.write('refreshToken', response['refreshToken']);

    var id = await _authService.getUserId();

    await _getStorage.write(Constants.USER_KEY, id);
  }
}
