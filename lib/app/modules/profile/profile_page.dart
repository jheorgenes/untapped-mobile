import 'dart:async';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:validatorless/validatorless.dart';
import '../../core/widgets_ui/app_bar_navigator.dart';
import '../../core/widgets_ui/elevated_button_ui.dart';
import '../../core/widgets_ui/input_form_ui.dart';
import './profile_controller.dart';

class ProfilePage extends GetView<ProfileController> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  ProfilePage({super.key});

  _submit() async {
    final formValid = _formKey.currentState?.validate() ?? false;
    final createdAt = DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now());

    final data = {
      'username': _userNameController.text,
      'email': _emailController.text,
      'fullName': _nameController.text,
      'password': _passwordController.text,
      'cpf': _cpfController.text,
      'createdAt': createdAt,
      "birthDate": _birthDateController.text,
      "accountNonExpired": true,
      "accountNonLocked": true,
      "credentialsNonExpired": true,
      "enabled": true
    };

    if (formValid) {
      var result = await controller.updateUser(data);

      if (result?['id'] != null) {
        await Get.defaultDialog(
          title: 'Usuário criado com sucesso!',
          middleText: '',
        );

        Timer(const Duration(milliseconds: 800), () {
          Get.offNamed('/home');
        });
      } else {
        Get.defaultDialog(
          title: 'Erro ao atualizar usuário!',
          middleText: '',
          barrierDismissible: false,
        );

        Timer(const Duration(seconds: 1), () {
          Get.back();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var user = controller.authService.user.value;
    _userNameController.text = user['username'];
    _emailController.text = user['email'];
    _nameController.text = user['fullname'] ?? '';
    _cpfController.text = user['cpf'];
    _birthDateController.text = user['birthDate'];
    _passwordController.text = '************';
    _confirmPasswordController.text = '************';

    return Obx(() {
      return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBarNavigator(
          title: 'Meu perfil',
          showIcon: false,
          color: Theme.of(context).backgroundColor,
          customRightWidget: !controller.editMode.value
              ? ElevatedButtonUi(
                  backgroundColor: Colors.transparent,
                  callback: () {
                    controller.editMode(true);
                  },
                  child: const Text(
                    'Editar',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              : null,
        ),
        body: SizedBox(
          width: context.width,
          height: context.height,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: SingleChildScrollView(
                child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Usuário',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  // DropdownButtonWidget(
                  //   title: 'Tipo de usuário',
                  //   items: controller.items,
                  //   onChanged: (labels) {
                  //     controller.selectedPermissions = labels
                  //         .map((label) => controller.items.firstWhere(
                  //             (element) => label == element['label']))
                  //         .toList();
                  //   },
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  InputFormUi(
                    enabled: controller.editMode.value,
                    type: 'text',
                    label: 'Nome de usuário',
                    textColor: Colors.white,
                    controller: _userNameController,
                    validator:
                        Validatorless.required('Nome de usuário é obrigatório'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InputFormUi(
                    type: 'text',
                    enabled: controller.editMode.value,
                    label: 'Nome completo',
                    textColor: Colors.white,
                    controller: _nameController,
                    validator: Validatorless.required('Nome é obrigatório'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InputFormUi(
                    type: 'text',
                    enabled: controller.editMode.value,
                    label: 'Email',
                    controller: _emailController,
                    textColor: Colors.white,
                    validator: Validatorless.required('Email é obrigatório'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InputFormUi(
                    type: 'texr',
                    enabled: controller.editMode.value,
                    label: 'CPF',
                    textColor: Colors.white,
                    controller: _cpfController,
                    validator: Validatorless.required('CPF é obrigatório'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InputFormUi(
                    type: 'date',
                    enabled: controller.editMode.value,
                    label: 'Data de nascimento',
                    textColor: Colors.white,
                    controller: _birthDateController,
                    validator: Validatorless.required(
                        'Data de nascimento é obrigatório'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InputFormUi(
                    type: 'password',
                    enabled: controller.editMode.value,
                    label: 'Senha',
                    textColor: Colors.white,
                    validator: Validatorless.multiple([
                      Validatorless.required('Senha é obrigatório'),
                      Validatorless.min(
                          8, 'A senha deve ter no mínimo 8 digitos')
                    ]),
                    colorIconHide: Colors.white,
                    controller: _passwordController,
                  ),
                  if (controller.editMode.value)
                    const SizedBox(
                      height: 10,
                    ),
                  if (controller.editMode.value)
                    //edit mode
                    InputFormUi(
                      type: 'password',
                      enabled: controller.editMode.value,
                      label: 'Confirmar senha',
                      textColor: Colors.white,
                      controller: _confirmPasswordController,
                      colorIconHide: Colors.white,
                      validator: Validatorless.multiple([
                        Validatorless.compare(
                            _passwordController, 'Senha devem ser iguais'),
                        Validatorless.required('Deve confirmar a senha'),
                      ]),
                    ),
                  if (controller.editMode.value)
                    const SizedBox(
                      height: 10,
                    ),
                  if (controller.editMode.value)
                    ElevatedButtonUi(
                      callback: _submit,
                      child: SizedBox(
                        width: context.width,
                        height: 57,
                        child:
                            const Center(child: Text('Atualizar informações')),
                      ),
                    ),
                ],
              ),
            )),
          ),
        ),
      );
    });
  }
}
