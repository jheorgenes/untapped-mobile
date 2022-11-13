import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:untapped/app/core/widgets_ui/app_bar_navigator.dart';
import 'package:untapped/app/core/widgets_ui/elevated_button_ui.dart';
import 'package:untapped/app/core/widgets_ui/input_form_ui.dart';
import './register_controller.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({Key? key}) : super(key: key);

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
                const InputFormUi(
                  type: 'text',
                  label: 'Nome completo',
                  textColor: Colors.black,
                ),
                const SizedBox(
                  height: 10,
                ),
                const InputFormUi(
                  type: 'text',
                  label: 'Email',
                  textColor: Colors.black,
                ),
                const SizedBox(
                  height: 10,
                ),
                const InputFormUi(
                  type: 'password',
                  label: 'Senha',
                  textColor: Colors.black,
                ),
                const SizedBox(
                  height: 10,
                ),
                const InputFormUi(
                  type: 'password',
                  label: 'Confirmar senha',
                  textColor: Colors.black,
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButtonUi(
                  callback: () {},
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
    );
  }
}
