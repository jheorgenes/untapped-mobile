import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:untapped/app/core/widgets_ui/rounted_buttom_ui.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/widgets_ui/input_form_ui.dart';

class TicketWidget extends StatelessWidget {
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _ticketExpirationDateController =
      TextEditingController();
  final TextEditingController _ticketClassificationController =
      TextEditingController();
  late Map<String, dynamic> _ticket;

  final VoidCallback removeItem;
  final Map<String, dynamic> ticket;
  final String defaultExpirationDate;

  final Function(Map<String, dynamic>) updateTicket;

  TicketWidget(
      {super.key,
      required this.removeItem,
      required this.updateTicket,
      required this.ticket,
      required this.defaultExpirationDate}) {
    _ticket = ticket;
  }

  @override
  Widget build(BuildContext context) {
    _descriptionController.text = ticket['description'] ?? '';
    _priceController.text = ticket['valueTicket'] ?? '';
    _quantityController.text = ticket['numberOfTicketsPerRating'] ?? '';
    _ticketClassificationController.text = ticket['ticketClassification'] ?? '';
    _ticketExpirationDateController.text = defaultExpirationDate;
    _ticket['expirationDate'] = defaultExpirationDate;
    updateTicket(_ticket);
    return Container(
      margin: const EdgeInsets.only(
        bottom: 20,
      ),
      padding: const EdgeInsets.all(10),
      width: context.width,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: const Color(0XFF636882)),
        borderRadius: const BorderRadius.all(Radius.circular(4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Ticket',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                RountedButtomUi(
                  primaryColor: Colors.red,
                  callback: removeItem,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: FaIcon(
                      FontAwesomeIcons.xmark,
                      size: 11,
                    ),
                  ),
                ),
              ],
            ),
          ),
          InputFormUi(
            label: 'Descrição',
            type: 'text',
            controller: _descriptionController,
            baseColor: const Color(0XFF636882),
            validator: Validatorless.required('Descrição obrigatório'),
            onChanged: (va) {
              _ticket['description'] = va;
              updateTicket(_ticket);
            },
          ),
          const SizedBox(
            height: 10,
          ),
          InputFormUi(
            label: 'Classificação',
            type: 'text',
            controller: _ticketClassificationController,
            baseColor: const Color(0XFF636882),
            validator: Validatorless.required('  obrigatório'),
            onChanged: (va) {
              _ticket['ticketClassification'] = va;
              updateTicket(_ticket);
            },
          ),
          const SizedBox(
            height: 10,
          ),
          InputFormUi(
            label: 'Data de expiração',
            type: 'date',
            controller: _ticketExpirationDateController,
            baseColor: const Color(0XFF636882),
            validator: Validatorless.required('obrigatório'),
            onChanged: (va) {
              _ticket['expirationDate'] = va;
              updateTicket(_ticket);
            },
          ),
          const SizedBox(
            height: 10,
          ),
          InputFormUi(
            label: 'Quantidade de ingressos',
            type: 'number',
            controller: _quantityController,
            baseColor: const Color(0XFF636882),
            validator: Validatorless.required('Quantidade obrigatório'),
            onChanged: (va) {
              _ticket['numberOfTicketsPerRating'] = va;
              updateTicket(_ticket);
            },
          ),
          const SizedBox(
            height: 10,
          ),
          InputFormUi(
            label: 'Valor',
            type: 'text',
            controller: _priceController,
            baseColor: const Color(0XFF636882),
            validator: Validatorless.required('Valor obrigatório'),
            onChanged: (va) {
              _ticket['valueTicket'] = va;
              updateTicket(_ticket);
            },
          ),
        ],
      ),
    );
  }
}
