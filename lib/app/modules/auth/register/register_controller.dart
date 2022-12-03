import 'package:get/get.dart';
import 'package:untapped/app/core/repository/user_repository.dart';

class RegisterController extends GetxController {
  final IUserRepository _userRepository;
  RegisterController(this._userRepository);
  final String welcomeMessage =
      'Crie sua conta e tenha acesso fácil aos melhores eventos';
  List? selectedPermissions = [];
  final permissions = [
    {
      'id': 1,
      'description': 'ADMIN',
      'authority': 'ADMIN',
    },
    {
      'id': 2,
      'description': 'MANAGER',
      'authority': 'MANAGER',
    },
    {
      "id": 3,
      "description": "USER",
      "authority": "USER",
    },
  ];

  final items = const [
    {
      'value': 'ADMIN',
      'label': 'Administrador',
    },
    {
      'value': 'MANAGER',
      'label': 'Gerenciador',
    },
    {
      'value': 'USER',
      'label': 'Usuário',
    },
  ];

  Future createUser(Map<String, dynamic> data) async {
    final dataPermissions = [];
    for (var permission in permissions) {
      dynamic isSelected = selectedPermissions!.firstWhereOrNull(
        (selected) {
          if (selected != null &&
              selected['value'] != null &&
              permission['authority'] != null) {
            return selected?['value'] == permission['authority'];
          } else {
            return false;
          }
        },
      );
      if (isSelected != null) {
        dataPermissions.add(permission);
      }
    }

    data['permissions'] = dataPermissions;

    var result = await _userRepository.create(data);

    return result;
  }
}
