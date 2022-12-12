import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:untapped/app/core/widgets_ui/rounted_buttom_ui.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/widgets_ui/input_form_ui.dart';

class TicketWidget extends StatefulWidget {
  final Map<String, dynamic> ticket;
  final VoidCallback removeItem;
  final String defaultExpirationDate;
  final bool? enabledInputs;
  final Function(Map<String, dynamic>) updateTicket;

  const TicketWidget({
    super.key,
    required this.removeItem,
    required this.updateTicket,
    required this.ticket,
    required this.defaultExpirationDate,
    this.enabledInputs = true,
  });

  @override
  State<TicketWidget> createState() => _TicketWidgetState();
}

class _TicketWidgetState extends State<TicketWidget> {
  final TextEditingController _descriptionController = TextEditingController();

  final TextEditingController _quantityController = TextEditingController();

  final TextEditingController _priceController = TextEditingController();

  final TextEditingController ticketExpirationDateController =
      TextEditingController();

  final TextEditingController ticketClassificationController =
      TextEditingController();

  @override
  void initState() {
    _descriptionController.text = widget.ticket['description'] ?? '';
    _priceController.text = widget.ticket['valueTicket'] != null
        ? widget.ticket['valueTicket'].toString()
        : '';
    _quantityController.text =
        widget.ticket['numberOfTicketsPerRating'].toString();
    ticketClassificationController.text =
        widget.ticket['ticketClassification'] ?? '';
    ticketExpirationDateController.text = widget.defaultExpirationDate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                if (widget.enabledInputs == true)
                  RountedButtomUi(
                    primaryColor: Colors.red,
                    callback: widget.removeItem,
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
            enabled: widget.enabledInputs,
            type: 'text',
            controller: _descriptionController,
            baseColor: const Color(0XFF636882),
            validator: Validatorless.required('Descrição obrigatório'),
            onChanged: (va) {
              widget.ticket['description'] = va;
              widget.updateTicket(widget.ticket);
            },
          ),
          const SizedBox(
            height: 10,
          ),
          InputFormUi(
            label: 'Classificação',
            enabled: widget.enabledInputs,
            type: 'text',
            controller: ticketClassificationController,
            baseColor: const Color(0XFF636882),
            validator: Validatorless.required('  obrigatório'),
            onChanged: (va) {
              widget.ticket['ticketClassification'] = va;
              widget.updateTicket(widget.ticket);
            },
          ),
          const SizedBox(
            height: 10,
          ),
          InputFormUi(
            label: 'Data de expiração',
            enabled: widget.enabledInputs,
            type: 'datetime',
            controller: ticketExpirationDateController,
            baseColor: const Color(0XFF636882),
            validator: Validatorless.required('obrigatório'),
            onChanged: (va) {
              widget.ticket['expirationDate'] = va;
              widget.updateTicket(widget.ticket);
            },
          ),
          const SizedBox(
            height: 10,
          ),
          InputFormUi(
            label: 'Quantidade de ingressos',
            enabled: widget.enabledInputs,
            type: 'text',
            controller: _quantityController,
            baseColor: const Color(0XFF636882),
            validator: Validatorless.required('Quantidade obrigatório'),
            onChanged: (va) {
              widget.ticket['numberOfTicketsPerRating'] = va;
              widget.updateTicket(widget.ticket);
            },
          ),
          const SizedBox(
            height: 10,
          ),
          InputFormUi(
            label: 'Valor',
            type: 'text',
            enabled: widget.enabledInputs,
            controller: _priceController,
            baseColor: const Color(0XFF636882),
            validator: Validatorless.required('Valor obrigatório'),
            onChanged: (va) {
              widget.ticket['valueTicket'] = va;
              widget.updateTicket(widget.ticket);
            },
          ),
        ],
      ),
    );
  }
}
