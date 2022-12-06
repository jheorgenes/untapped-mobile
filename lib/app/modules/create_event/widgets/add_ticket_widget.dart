import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untapped/app/core/models/ticket_model.dart';
import 'package:untapped/app/core/widgets_ui/elevated_button_ui.dart';
import 'package:untapped/app/modules/create_event/widgets/ticket_widget.dart';

class AddTicketWidget extends StatefulWidget {
  final Function(List<Map<String, dynamic>> tickets) setTickets;
  final List<TicketModel>? defaultValues;

  final TextEditingController deadLineController;

  const AddTicketWidget({
    super.key,
    required this.setTickets,
    required this.deadLineController,
    this.defaultValues,
  });

  @override
  State<AddTicketWidget> createState() => _AddTicketWidgetState();
}

class _AddTicketWidgetState extends State<AddTicketWidget> {
  List<Map<String, dynamic>> _tickets = [];

  _incrementTicket() {
    setState(() {
      _tickets.add({
        'statusTicket': 'DISPONIVEL',
        'expirationDate': widget.deadLineController.text,
      });
    });
  }

  _removeItem(index) {
    setState(() {
      _tickets.removeAt(index);
    });
  }

  _updateTicket(index, ticket) {
    _tickets[index] = ticket;
  }

  @override
  void initState() {
    if (widget.defaultValues != null) {
      _tickets = widget.defaultValues!.map((e) => e.toMap()).toList();
      widget.setTickets(_tickets);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          if (widget.defaultValues != null)
            const Text(
              'Só é possível a definição dos tickets na criação do evento.',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          if (widget.defaultValues == null)
            ElevatedButtonUi(
              backgroundColor: const Color(0XFF636882),
              callback: () {
                _incrementTicket();
                widget.setTickets(_tickets);
              },
              child: IntrinsicWidth(
                child: Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      FaIcon(
                        FontAwesomeIcons.plus,
                        size: 14,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('Adicionar ticket'),
                    ],
                  ),
                ),
              ),
            ),
          const SizedBox(
            height: 20,
          ),
          ..._tickets.asMap().entries.map(
            (entry) {
              return TicketWidget(
                key: UniqueKey(),
                defaultExpirationDate: widget.deadLineController.text,
                ticket: _tickets[entry.key],
                enabledInputs: widget.defaultValues != null ? false : true,
                updateTicket: (p0) {
                  _updateTicket(entry.key, p0);
                  widget.setTickets(_tickets);
                },
                removeItem: () {
                  _removeItem(entry.key);
                  widget.setTickets(_tickets);
                },
              );
            },
          ).toList()
        ],
      ),
    );
  }
}
