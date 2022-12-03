import 'package:get/get.dart';
import 'package:untapped/app/core/repository/user_repository.dart';
import './register_controller.dart';

class RegisterBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IUserRepository>(() => UserRepository(Get.find()));
    Get.put(RegisterController(Get.find()));
  }
}
