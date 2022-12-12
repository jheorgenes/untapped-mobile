import 'dart:io';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:untapped/app/core/models/event_model.dart';
import 'package:untapped/app/core/models/ticket_model.dart';
import 'package:untapped/app/core/services/app_state.dart';
import 'package:untapped/app/core/services/validators.dart';
import 'package:untapped/app/core/widgets_ui/app_bar_navigator.dart';
import 'package:untapped/app/core/widgets_ui/elevated_button_ui.dart';
import 'package:untapped/app/core/widgets_ui/input_form_ui.dart';
import 'package:untapped/app/modules/create_event/widgets/add_media_widget.dart';
import 'package:untapped/app/modules/create_event/widgets/add_ticket_widget.dart';
import 'package:validatorless/validatorless.dart';
import '../auth/register/widgets/dropdown_button_widget.dart';
import './create_event_controller.dart';

class CreateEventPage extends StatefulWidget {
  const CreateEventPage({super.key});

  @override
  State<CreateEventPage> createState() => _CreateEventPageState();
}

class _CreateEventPageState
    extends AppState<CreateEventPage, CreateEventController> with Validators {
  static final _formKey = GlobalKey<FormState>();

  final TextEditingController _dateEntryController = TextEditingController();
  final TextEditingController _deadLineController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _subTitleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  //Address
  final TextEditingController _cepController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _titleAddressController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _complementController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final _categoriesSelected = [];
  var hasDefaultValues = false;
  var _defaultCategories = [];
  String _defaultMedia = '';
  List<TicketModel>? _defaultTickets;

  int _eventId = 0;
  String _mode = 'create';

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

  _submitForm() {
    final formValid = _formKey.currentState?.validate() ?? false;
    if (formValid) {
      controller.data = {
        'title': _titleController.text,
        'subTitle': _subTitleController.text,
        'dateEntry': _dateEntryController.text,
        'deadline': _deadLineController.text,
        'userId': controller.authService.user['id'],
        'photos': null,
        'media': null,
        'frontCover': controller.fileNameUpload == ''
            ? _defaultMedia
            : controller.fileNameUpload,
        'capacity': 3000,
        'description': _descriptionController.text,
        'categories': _categoriesSelected,
        'address': {
          'street': _streetController.text,
          'title': _titleAddressController.text,
          'district': _districtController.text,
          'addressComplement': _complementController.text,
          'addressNumber': _numberController.text,
          'cep': _cepController.text,
          'city': _cityController.text,
          'state': _stateController.text,
          'country': _countryController.text,
          'latitude': null,
          'longitude': null,
        },
        'tickets': controller.data['tickets'],
      };

      if (_mode == 'create') {
        controller.submitedForm();
      } else if (_mode == 'update') {
        controller.data['categories'] = _defaultCategories;
        controller.updateForm(_eventId);
      }
    }
  }

  _setDefaultValues(EventModel eventModel) {
    _titleController.text = eventModel.title;
    _subTitleController.text = eventModel.subTitle ?? '';
    _dateEntryController.text = eventModel.dateEntry;
    _descriptionController.text = eventModel.description ?? '';
    _deadLineController.text = eventModel.deadline;

    _titleAddressController.text = eventModel.addressEntity?.title ?? '';
    _streetController.text = eventModel.addressEntity?.street ?? '';
    _districtController.text = eventModel.addressEntity?.district ?? '';
    _complementController.text =
        eventModel.addressEntity?.addressComplement ?? '';
    _cepController.text = eventModel.addressEntity?.cep ?? '';
    _cityController.text = eventModel.addressEntity?.city ?? '';
    _stateController.text = eventModel.addressEntity?.state ?? '';
    _countryController.text = eventModel.addressEntity?.country ?? '';
    _numberController.text = eventModel.addressEntity?.addressNumber ?? '';

    _defaultMedia = eventModel.frontCover ?? '';
    _eventId = eventModel.id ?? 0;
    _defaultCategories = eventModel.categories;
    _defaultTickets = eventModel.tickets ?? [];
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments;

    if (args != null && !hasDefaultValues) {
      hasDefaultValues = true;
      var eventModel = args as EventModel;
      _mode = 'update';

      _setDefaultValues(eventModel);
    }
    controller.loaderListener(controller.loading);
    controller.modalConfirm(
      controller.modal,
      _mode == 'create'
          ? 'Evento criado com sucesso!'
          : 'Evento atualizado com sucesso!',
    );

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBarNavigator(
        title: 'New Event',
        showIcon: false,
        color: Theme.of(context).backgroundColor,
      ),
      resizeToAvoidBottomInset: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
              child: FutureBuilder(
                  future: controller.loadCategories(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return SizedBox(
                        height: context.heightTransformer(reducedBy: 40),
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    final categories = snapshot.data as List;
                    return Column(
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
                        AddMediaWidget(
                          defaultMedia: _defaultMedia,
                          callback: (File file) {
                            controller.uploadFile(file);
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        DropdownButtonWidget(
                          title: 'Categorias do evento',
                          selectedItems: _defaultCategories,
                          validator: (value) {
                            if (value == null || (value.isEmpty)) {
                              return 'Informe os categorias';
                            }
                            return null;
                          },
                          labelColor: const Color(0XFF636882),
                          labelKey: 'description',
                          items: categories,
                          onChanged: (labels) {
                            for (var label in labels) {
                              var result =
                                  categories.firstWhereOrNull((category) {
                                return category['description'] == label;
                              });
                              _categoriesSelected.add(result);
                            }

                            // controller.selectedPermissions = labels
                            //     .map((label) => controller.items.firstWhere(
                            //         (element) => label == element['label']))
                            //     .toList();
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        InputFormUi(
                          label: 'Título',
                          controller: _titleController,
                          baseColor: const Color(0XFF636882),
                          validator:
                              Validatorless.required('Título é obrigatório'),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        InputFormUi(
                          label: 'Sub título',
                          controller: _subTitleController,
                          baseColor: const Color(0XFF636882),
                          validator: Validatorless.required(
                              'Sub título é obrigatório'),
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
                          type: 'datetime',
                          label: 'Data início do evento',
                          controller: _dateEntryController,
                          baseColor: const Color(0XFF636882),
                          validator: Validatorless.required(
                              'Data início é obrigatório'),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        InputFormUi(
                          type: 'datetime',
                          label: 'Data fim do evento',
                          controller: _deadLineController,
                          baseColor: const Color(0XFF636882),
                          validator:
                              Validatorless.required('Data fim é obrigatório'),
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
                        const SizedBox(
                          height: 25,
                        ),
                        InputFormUi(
                          label: 'Nome do local',
                          controller: _titleAddressController,
                          baseColor: const Color(0XFF636882),
                          validator: Validatorless.required('Nome do local'),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        InputFormUi(
                          type: 'number',
                          label: 'Cep',
                          baseColor: const Color(0XFF636882),
                          controller: _cepController,
                          validator:
                              Validatorless.required('Cep é obrigatório'),
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
                          validator:
                              Validatorless.required('Rua é obrigatório'),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        InputFormUi(
                          label: 'Bairro',
                          controller: _districtController,
                          baseColor: const Color(0XFF636882),
                          validator:
                              Validatorless.required('Bairro é obrigatório'),
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
                          validator:
                              Validatorless.required('Número é obrigatório'),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        InputFormUi(
                          label: 'Cidade',
                          controller: _cityController,
                          baseColor: const Color(0XFF636882),
                          validator:
                              Validatorless.required('Cidade é obrigatório'),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        InputFormUi(
                          label: 'Estado',
                          controller: _stateController,
                          baseColor: const Color(0XFF636882),
                          validator:
                              Validatorless.required('Cidade é obrigatório'),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        InputFormUi(
                          label: 'País',
                          controller: _countryController,
                          baseColor: const Color(0XFF636882),
                          validator:
                              Validatorless.required('País é obrigatório'),
                        ),
                        AddTicketWidget(
                          defaultValues: _defaultTickets,
                          deadLineController: _deadLineController,
                          setTickets: (tickets) {
                            controller.data['tickets'] = tickets;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: ElevatedButtonUi(
                            callback: _submitForm,
                            child: SizedBox(
                              height: 57,
                              width: context.widthTransformer(reducedBy: 30),
                              child: Center(
                                child: Text(_mode == 'create'
                                    ? 'Cadastrar evento'
                                    : 'Atualizar evento'),
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
