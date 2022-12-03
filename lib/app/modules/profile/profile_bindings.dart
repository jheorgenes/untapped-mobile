import 'package:get/get.dart';
import '../../core/repository/user_repository.dart';
import './profile_controller.dart';

class ProfileBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IUserRepository>(() => UserRepository(Get.find()));

    Get.put(ProfileController(Get.find(), Get.find()));
  }
}
