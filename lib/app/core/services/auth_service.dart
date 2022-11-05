import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:untapped/app/core/constants/constants.dart';
import 'package:untapped/app/core/repository/auth_repository.dart';
import 'package:untapped/app/core/rest_client/rest_client.dart';

class AuthService extends GetxService {
  final _isLogged = false.obs;
  final RestClient _restClient = Get.find();
  final _authRepository = AuthRepository(Get.find());
  var user = {}.obs;

  final _getStorage = GetStorage();

  Future<AuthService> init() async {
    _getStorage.listenKey(Constants.USER_KEY, (value) {
      _isLogged(value != null);
    });
    var accessToken = await _getStorage.read('accessToken');

    if (accessToken != null) {
      _restClient.headersDefault['Authorization'] = 'Bearer $accessToken';
    }

    ever<bool?>(_isLogged, (isLogged) {
      if (isLogged == null || !isLogged) {
        Get.offAllNamed('/auth/presentation');
      } else {
        Get.offAllNamed('/home');
      }
    });

    _isLogged(getUserId() != null);

    return this;
  }

  void logout() => _getStorage.write(Constants.USER_KEY, null);

  getUserId() async {
    user(await _authRepository.me());

    if (user['id'] == null) {
      await _getStorage.write(Constants.USER_KEY, null);
      await _getStorage.remove('accessToken');
      await _getStorage.remove('refreshToken');
    }

    return user['id'];
  }
}
