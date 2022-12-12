import 'dart:async';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:untapped/app/core/widgets_ui/elevated_button_ui.dart';
import 'package:validatorless/validatorless.dart';
import '../../core/services/validators.dart';
import '../../core/widgets_ui/app_bar_navigator.dart';
import '../../core/widgets_ui/input_form_ui.dart';
import './address_controller.dart';

class AddressPage extends GetView<AddressController> with Validators {
  AddressPage({super.key});
  final _formKey = GlobalKey<FormState>();
  bool hasInit = false;

  //Address
  final TextEditingController _cepController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _complementController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();

  _getCep(cep) async {
    if (cepValid(cep)) {
      var address = await controller.loadCep(cep);

      _streetController.text = address['logradouro'];
      _districtController.text = address['bairro'];
      _cityController.text = address['localidade'];
      _cityController.text = address['localidade'];
      _stateController.text = address['uf'];
      _complementController.text = address['complemento'];
    }
  }

  _submitForm(address, userId) async {
    final formValid = _formKey.currentState?.validate() ?? false;
    if (formValid) {
      controller.data = {
        'id': address['id'],
        'userId': userId,
        'street': _streetController.text,
        'district': _districtController.text,
        'addressComplement': _complementController.text,
        'addressNumber': _numberController.text,
        'cep': _cepController.text,
        'city': _cityController.text,
        'state': _stateController.text,
        'country': _countryController.text,
        'latitude': null,
        'longitude': null,
      };
      var result = {};
      if (address != null) {
        result = await controller.submit(
            modeCreate: false, addressId: address['id']);
      } else {
        result = await controller.submit(modeCreate: true);
      }

      if (result['id'] != null) {
        await Get.defaultDialog(
          title: 'Endereço alterado com sucesso!',
          middleText: '',
        );

        Timer(const Duration(milliseconds: 800), () async {
          controller.authService.reloadUser();
          await Get.offAllNamed('/home');
        });
      } else {
        Get.defaultDialog(
          title: 'Erro ao editar endereço!',
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
    var address = controller.authService.user['adresses']?[0];
    var userId = controller.authService.user['id'];

    if (address != null && !hasInit) {
      hasInit = true;
      _cepController.text = address['cep'] ?? '';
      _streetController.text = address['street'] ?? '';
      _districtController.text = address['district'] ?? '';
      _cityController.text = address['city'] ?? '';
      _stateController.text = address['state'] ?? '';
      _countryController.text = address['country'] ?? '';
      _complementController.text = address['addressComplement'] ?? '';
      _numberController.text = address['addressNumber'] ?? '';
    }

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBarNavigator(
        title: 'Endereço',
        showIcon: false,
        color: Theme.of(context).backgroundColor,
      ),
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButtonUi(
        callback: () => _submitForm(address, userId),
        child: SizedBox(
          height: 57,
          width: context.widthTransformer(reducedBy: 30),
          child: Center(
            child: Text(
                address != null ? 'Atualizar endereço' : 'Salvar endereço'),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            margin: const EdgeInsets.only(
              bottom: 100,
            ),
            width: context.width,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  'Endereço',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                // const SizedBox(
                //   height: 25,
                // ),
                // ElevatedButtonUi(
                //   backgroundColor: Theme.of(context).backgroundColor,
                //   callback: controller.determinePosition,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: [
                //       const FaIcon(FontAwesomeIcons.locationCrosshairs),
                //       Container(
                //         width: context.widthTransformer(reducedBy: 20),
                //         padding: const EdgeInsets.all(10),
                //         child: const Text(
                //           'Usar localização atual',
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                const SizedBox(
                  height: 25,
                ),
                InputFormUi(
                  type: 'number',
                  label: 'Cep',
                  baseColor: const Color(0XFF636882),
                  controller: _cepController,
                  validator: Validatorless.required('Cep é obrigatório'),
                  unfocused: () {
                    _getCep(_cepController.text);
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                InputFormUi(
                  label: 'Rua/Av',
                  controller: _streetController,
                  baseColor: const Color(0XFF636882),
                  validator: Validatorless.required('Rua é obrigatório'),
                ),
                const SizedBox(
                  height: 25,
                ),
                InputFormUi(
                  label: 'Bairro',
                  controller: _districtController,
                  baseColor: const Color(0XFF636882),
                  validator: Validatorless.required('Bairro é obrigatório'),
                ),
                const SizedBox(
                  height: 25,
                ),
                InputFormUi(
                  label: 'Complemento',
                  controller: _complementController,
                  baseColor: const Color(0XFF636882),
                ),
                const SizedBox(
                  height: 25,
                ),
                InputFormUi(
                  type: 'number',
                  label: 'Número',
                  controller: _numberController,
                  baseColor: const Color(0XFF636882),
                  validator: Validatorless.required('Número é obrigatório'),
                ),
                const SizedBox(
                  height: 25,
                ),
                InputFormUi(
                  label: 'Cidade',
                  controller: _cityController,
                  baseColor: const Color(0XFF636882),
                  validator: Validatorless.required('Cidade é obrigatório'),
                ),
                const SizedBox(
                  height: 25,
                ),
                InputFormUi(
                  label: 'Estado',
                  controller: _stateController,
                  baseColor: const Color(0XFF636882),
                  validator: Validatorless.required('Cidade é obrigatório'),
                ),
                const SizedBox(
                  height: 25,
                ),
                InputFormUi(
                  label: 'País',
                  controller: _countryController,
                  baseColor: const Color(0XFF636882),
                  validator: Validatorless.required('País é obrigatório'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
