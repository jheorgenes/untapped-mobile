import 'dart:async';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';
import '../../core/widgets_ui/app_bar_navigator.dart';
import '../../core/widgets_ui/elevated_button_ui.dart';
import '../../core/widgets_ui/input_form_ui.dart';
import './categories_controller.dart';

class CategoriesPage extends GetView<CategoriesController> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _descriptionController = TextEditingController();

  CategoriesPage({super.key});

  _submitForm() async {
    final formValid = _formKey.currentState?.validate() ?? false;

    final data = {
      'description': _descriptionController.text,
    };

    if (formValid) {
      var result = await controller.createCategory(data);

      if (result?['id'] != null) {
        await Get.defaultDialog(
          title: 'Categoria criado com sucesso!',
          middleText: '',
        );

        Timer(const Duration(milliseconds: 800), () {
          Get.offNamed('/home');
        });
      } else {
        Get.defaultDialog(
          title: 'Erro ao criar categoria!',
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
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBarNavigator(
        title: 'Criar categoria',
        showIcon: false,
        color: Theme.of(context).backgroundColor,
      ),
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButtonUi(
        callback: _submitForm,
        child: SizedBox(
          height: 57,
          width: context.widthTransformer(reducedBy: 30),
          child: const Center(
            child: Text('Cadastrar categoria'),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Text(
                  'Dados da categoria',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                InputFormUi(
                  label: 'Descrição',
                  controller: _descriptionController,
                  baseColor: const Color(0XFF636882),
                  validator: Validatorless.required('Sub título é obrigatório'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
