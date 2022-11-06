import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:untapped/app/core/widgets_ui/app_bar_navigator.dart';
import 'package:untapped/app/core/widgets_ui/elevated_button_ui.dart';
import 'package:untapped/app/core/widgets_ui/input_form_ui.dart';
import 'package:untapped/app/modules/create_event/widgets/add_media_widget.dart';
import 'package:untapped/app/modules/create_event/widgets/add_ticket_widget.dart';
import 'package:validatorless/validatorless.dart';
import './create_event_controller.dart';

class CreateEventPage extends GetView<CreateEventController> {
  CreateEventPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _dateEntryController = TextEditingController();
  final TextEditingController _deadLineController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _subTitleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _complementController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _cepController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _contryController = TextEditingController();

  _submitForm() {
    final formValid = _formKey.currentState?.validate() ?? false;
    if (formValid) {
      var data = {
        "title": _titleController.text,
        "subTitle": _subTitleController.text,
        "dateEntry": _dateEntryController.text,
        "deadline": _deadLineController.text,
        "photos": null,
        "media": null,
        "frontCover": "Capa Provisória",
        "address": {
          "street": _streetController.text,
          "district": _districtController.text,
          "addressComplement": _complementController.text,
          "addressNumber": _numberController.text,
          "cep": _cepController.text,
          "city": _cityController.text,
          "state": _stateController.text,
          "contry": _contryController.text,
          "latitude": null,
          "longitude": null,
          "capacity": 3000,
          "description": _descriptionController.text,
        },
      };

      controller.submitedForm(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBarNavigator(
        title: 'New Event',
        showIcon: false,
        color: Theme.of(context).backgroundColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButtonUi(
        callback: _submitForm,
        child: SizedBox(
          height: 57,
          width: context.widthTransformer(reducedBy: 30),
          child: const Center(
            child: Text('Cadastrar evento'),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: context.width,
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
          ),
          margin: const EdgeInsets.only(bottom: 100),
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Dados do evento',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const AddMediaWidget(),
                  const SizedBox(
                    height: 15,
                  ),
                  InputFormUi(
                    label: 'Título',
                    controller: _titleController,
                    baseColor: const Color(0XFF636882),
                    validator: Validatorless.required('Título é obrigatório'),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InputFormUi(
                    label: 'Sub título',
                    controller: _subTitleController,
                    baseColor: const Color(0XFF636882),
                    validator:
                        Validatorless.required('Sub título é obrigatório'),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  InputFormUi(
                    label: 'Descrição',
                    controller: _descriptionController,
                    baseColor: const Color(0XFF636882),
                    validator:
                        Validatorless.required('Descrição é obrigatória'),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  InputFormUi(
                    type: 'date',
                    label: 'Data início do evento',
                    controller: _dateEntryController,
                    baseColor: const Color(0XFF636882),
                    validator:
                        Validatorless.required('Data início é obrigatório'),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  InputFormUi(
                    type: 'date',
                    label: 'Data fim do evento',
                    controller: _deadLineController,
                    baseColor: const Color(0XFF636882),
                    validator: Validatorless.required('Data fim é obrigatório'),
                  ),
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
                    label: 'Número',
                    controller: _numberController,
                    baseColor: const Color(0XFF636882),
                    validator: Validatorless.required('Número é obrigatório'),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  InputFormUi(
                    label: 'Cep',
                    baseColor: const Color(0XFF636882),
                    controller: _cepController,
                    validator: Validatorless.required('Cep é obrigatório'),
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
                    controller: _contryController,
                    baseColor: const Color(0XFF636882),
                    validator: Validatorless.required('País é obrigatório'),
                  ),
                  const AddTicketWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
