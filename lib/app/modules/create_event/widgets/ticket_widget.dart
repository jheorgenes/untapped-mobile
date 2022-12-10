import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:untapped/app/core/widgets_ui/rounted_buttom_ui.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/widgets_ui/input_form_ui.dart';

class TicketWidget extends StatelessWidget {
  final Map<String, dynamic> ticket;
  final VoidCallback removeItem;
  final String defaultExpirationDate;
  final bool? enabledInputs;
  final Function(Map<String, dynamic>) updateTicket;
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController ticketExpirationDateController =
      TextEditingController();
  final TextEditingController ticketClassificationController =
      TextEditingController();

  TicketWidget({
    super.key,
    required this.removeItem,
    required this.updateTicket,
    required this.ticket,
    required this.defaultExpirationDate,
    this.enabledInputs = true,
  });

  @override
  Widget build(BuildContext context) {
    _descriptionController.text = ticket['description'] ?? '';
    _priceController.text =
        ticket['valueTicket'] != null ? ticket['valueTicket'].toString() : '';
    _quantityController.text = ticket['numberOfTicketsPerRating'] != null
        ? ticket['numberOfTicketsPerRating'].toString()
        : '';
    ticketClassificationController.text = ticket['ticketClassification'] ?? '';
    ticketExpirationDateController.text = defaultExpirationDate;

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
                if (enabledInputs == true)
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
            enabled: enabledInputs,
            type: 'text',
            controller: _descriptionController,
            baseColor: const Color(0XFF636882),
            validator: Validatorless.required('Descrição obrigatório'),
            onChanged: (va) {
              ticket['description'] = va;
              updateTicket(ticket);
            },
          ),
          const SizedBox(
            height: 10,
          ),
          InputFormUi(
            label: 'Classificação',
            enabled: enabledInputs,
            type: 'text',
            controller: ticketClassificationController,
            baseColor: const Color(0XFF636882),
            validator: Validatorless.required('  obrigatório'),
            onChanged: (va) {
              ticket['ticketClassification'] = va;
              updateTicket(ticket);
            },
          ),
          const SizedBox(
            height: 10,
          ),
          InputFormUi(
            label: 'Data de expiração',
            enabled: enabledInputs,
            type: 'datetime',
            controller: ticketExpirationDateController,
            baseColor: const Color(0XFF636882),
            validator: Validatorless.required('obrigatório'),
            onChanged: (va) {
              ticket['expirationDate'] = va;
              updateTicket(ticket);
            },
          ),
          const SizedBox(
            height: 10,
          ),
          InputFormUi(
            label: 'Quantidade de ingressos',
            enabled: enabledInputs,
            type: 'number',
            controller: _quantityController,
            baseColor: const Color(0XFF636882),
            validator: Validatorless.required('Quantidade obrigatório'),
            onChanged: (va) {
              ticket['numberOfTicketsPerRating'] = va;
              updateTicket(ticket);
            },
          ),
          const SizedBox(
            height: 10,
          ),
          InputFormUi(
            label: 'Valor',
            type: 'text',
            enabled: enabledInputs,
            controller: _priceController,
            baseColor: const Color(0XFF636882),
            validator: Validatorless.required('Valor obrigatório'),
            onChanged: (va) {
              ticket['valueTicket'] = va;
              updateTicket(ticket);
            },
          ),
        ],
      ),
    );
  }
}
