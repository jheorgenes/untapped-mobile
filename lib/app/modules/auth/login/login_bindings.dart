import 'package:get/get.dart';
import 'package:untapped/app/core/repository/auth_repository.dart';
import './login_controller.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IAuthRepository>(() => AuthRepository(Get.find()));
    Get.put(LoginController(Get.find(), Get.find()));
  }
}
