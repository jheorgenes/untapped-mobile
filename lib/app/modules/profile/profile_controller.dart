import 'package:get/get.dart';
import 'package:untapped/app/core/repository/user_repository.dart';
import 'package:untapped/app/core/services/auth_service.dart';

class ProfileController extends GetxController {
  final AuthService authService;
  final IUserRepository userRepository;
  final editMode = false.obs;

  ProfileController(this.authService, this.userRepository);

  updateUser(Map<String, dynamic> data, int id) async {
    var result = await userRepository.update(data, id);

    return result;
  }
}
