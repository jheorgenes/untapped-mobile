import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:untapped/app/core/widgets_ui/app_bar_navigator.dart';
import 'package:untapped/app/core/widgets_ui/elevated_button_ui.dart';
import 'package:untapped/app/core/widgets_ui/input_form_ui.dart';
import '../../../core/services/app_state.dart';
import './login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends AppState<LoginPage, LoginController> {
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void initState() {
    _userName.text = 'jheorgenes@gmail.com';
    _password.text = 'admin234';
    super.initState();
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: context.heightTransformer(reducedBy: 85),
                ),
                const Text(
                  'Login Account',
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
                InputFormUi(
                  textColor: Colors.black,
                  label: 'Email',
                  controller: _userName,
                ),
                const SizedBox(
                  height: 10,
                ),
                InputFormUi(
                  textColor: Colors.black,
                  type: 'password',
                  label: 'Senha',
                  controller: _password,
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButtonUi(
                  callback: () {
                    controller.authenticate({
                      'username': _userName.text,
                      'password': _password.text,
                    });
                  },
                  child: SizedBox(
                    width: context.width,
                    height: 57,
                    child: const Center(
                      child: Text('Login'),
                    ),
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
