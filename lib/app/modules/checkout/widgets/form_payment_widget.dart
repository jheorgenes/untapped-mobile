import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untapped/app/core/widgets_ui/input_form_ui.dart';
import 'package:validatorless/validatorless.dart';

class FormPaymentWidget extends StatelessWidget {
  FormPaymentWidget({super.key, required this.formKey});
  Key formKey;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _dateValidController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30,
        ),
        const Text(
          'Detalhes',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Form(
          key: formKey,
          child: Column(
            children: [
              InputFormUi(
                label: 'Seu email',
                controller: _emailController,
                baseColor: const Color(0XFF636882),
                validator: Validatorless.required('Seu email'),
              ),
              const SizedBox(
                height: 14,
              ),
              InputFormUi(
                label: 'Nome',
                controller: _nameController,
                baseColor: const Color(0XFF636882),
                validator: Validatorless.required('Nome obrigatório'),
              ),
              const SizedBox(
                height: 14,
              ),
              InputFormUi(
                label: 'Número do cartão',
                controller: _cardNumberController,
                baseColor: const Color(0XFF636882),
                validator: Validatorless.required('Número do cartão'),
              ),
              const SizedBox(
                height: 14,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: context.widthTransformer(reducedBy: 60),
                    child: InputFormUi(
                      label: 'Validade',
                      controller: _dateValidController,
                      baseColor: const Color(0XFF636882),
                      validator: Validatorless.required('Validade'),
                    ),
                  ),
                  SizedBox(
                    width: context.widthTransformer(reducedBy: 60),
                    child: InputFormUi(
                      label: 'CVV',
                      controller: _cvvController,
                      baseColor: const Color(0XFF636882),
                      validator: Validatorless.required('CVV'),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
