import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:untapped/app/core/widgets_ui/elevated_button_ui.dart';
import './presentation_controller.dart';

class PresentationPage extends GetView<PresentationController> {
  const PresentationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: context.width,
        height: context.height,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                controller.presentationMessage,
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0XFF9E9E9E),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButtonUi(
                callback: () {
                  Get.toNamed('/auth/login');
                },
                child: SizedBox(
                  width: context.width,
                  height: 57,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      FaIcon(
                        FontAwesomeIcons.message,
                        color: Colors.white,
                        size: 13,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('Login with Email'),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 1,
                      decoration: const BoxDecoration(
                        color: Color(0XFF9E9E9E),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: const BoxDecoration(
                      color: Color(0XFFF7F8FA),
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    child: const Text(
                      'OU',
                      style: TextStyle(color: Color(0XFF9E9E9E)),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 1,
                      decoration: const BoxDecoration(
                        color: Color(0XFF9E9E9E),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButtonUi(
                borderSide: const BorderSide(
                  color: Colors.black,
                ),
                backgroundColor: Colors.transparent,
                callback: () {
                  Get.toNamed('/auth/register');
                },
                child: SizedBox(
                  width: context.width,
                  height: 57,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      FaIcon(
                        FontAwesomeIcons.user,
                        color: Colors.black,
                        size: 13,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Criar conta',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
