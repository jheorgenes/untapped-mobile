import 'dart:async';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:untapped/app/core/widgets_ui/app_bar_navigator.dart';
import 'package:untapped/app/core/widgets_ui/elevated_button_ui.dart';
import 'package:untapped/app/core/widgets_ui/input_form_ui.dart';
import 'package:untapped/app/modules/auth/register/widgets/dropdown_button_widget.dart';
import 'package:validatorless/validatorless.dart';
import './register_controller.dart';

class RegisterPage extends GetView<RegisterController> {
  RegisterPage({super.key});

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();

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
      var result = await controller.createUser(data);

      if (result?['id'] != null) {
        await Get.defaultDialog(
          title: 'Usuário criado com sucesso!',
          middleText: '',
        );

        Timer(const Duration(milliseconds: 800), () {
          Get.offNamed('/auth/login');
        });
      } else {
        Get.defaultDialog(
          title: 'Erro ao criar usuário!',
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
    return Scaffold(
      appBar: const AppBarNavigator(
        title: '',
        showIcon: false,
        color: Colors.transparent,
        backIconColor: Colors.black,
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
                    'Criar conta',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    controller.welcomeMessage,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0XFF9E9E9E),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DropdownButtonWidget(
                    title: 'Tipo de usuário',
                    selectedItems: const [],
                    validator: (value) {
                      if (value == null || (value.isEmpty)) {
                        return 'Informe o tipo de usuário';
                      }
                      return null;
                    },
                    items: controller.items,
                    onChanged: (labels) {
                      controller.selectedPermissions = labels
                          .map((label) => controller.items.firstWhere(
                              (element) => label == element['label']))
                          .toList();
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InputFormUi(
                    type: 'text',
                    label: 'Email de acesso',
                    textColor: Colors.black,
                    controller: _userNameController,
                    validator:
                        Validatorless.required('Nome de usuário é obrigatório'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InputFormUi(
                    type: 'text',
                    label: 'Nome completo',
                    textColor: Colors.black,
                    controller: _nameController,
                    validator: Validatorless.required('Nome é obrigatório'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InputFormUi(
                    type: 'text',
                    label: 'Email',
                    controller: _emailController,
                    textColor: Colors.black,
                    validator: Validatorless.required('Email é obrigatório'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InputFormUi(
                    type: 'number',
                    label: 'CPF',
                    textColor: Colors.black,
                    controller: _cpfController,
                    validator: Validatorless.required('CPF é obrigatório'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InputFormUi(
                    type: 'date',
                    label: 'Data de nascimento',
                    textColor: Colors.black,
                    controller: _birthDateController,
                    validator: Validatorless.required(
                        'Data de nascimento é obrigatório'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InputFormUi(
                    type: 'password',
                    label: 'Senha',
                    textColor: Colors.black,
                    validator: Validatorless.multiple([
                      Validatorless.required('Senha é obrigatório'),
                      Validatorless.min(
                          8, 'A senha deve ter no mínimo 8 digitos')
                    ]),
                    controller: _passwordController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InputFormUi(
                    type: 'password',
                    label: 'Confirmar senha',
                    textColor: Colors.black,
                    controller: _confirmPasswordController,
                    validator: Validatorless.multiple([
                      Validatorless.compare(
                          _passwordController, 'Senha devem ser iguais'),
                      Validatorless.required('Deve confirmar a senha'),
                    ]),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButtonUi(
                    callback: _submit,
                    child: SizedBox(
                      width: context.width,
                      height: 57,
                      child: const Center(child: Text('Criar conta')),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
