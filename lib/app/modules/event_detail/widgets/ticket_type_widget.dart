import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untapped/app/core/models/ticket_model.dart';
import 'package:untapped/app/modules/event_detail/widgets/count_select_widget.dart';

class TicketTypeWidget extends StatelessWidget {
  final TicketModel ticket;
  final Function(int count, TicketModel ticket) onSelectedTicket;

  const TicketTypeWidget({
    super.key,
    required this.ticket,
    required this.onSelectedTicket,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      width: double.infinity,
      height: 64,
      padding: const EdgeInsets.all(14),
      decoration: const BoxDecoration(
        color: Color(0XFF1A1C1F),
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 43,
            height: 36,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.white),
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: const Center(
                child: RotationTransition(
              turns: AlwaysStoppedAnimation(-45 / 360),
              child: FaIcon(
                FontAwesomeIcons.ticket,
                size: 20,
                color: Colors.white,
              ),
            )),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ticket.valueTicket.toString(),
                style: const TextStyle(color: Colors.white),
              ),
              Text(
                ticket.ticketClassification,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
          const Spacer(),
          CountSelectWidget(
            onChangeCount: (count) {
              onSelectedTicket(count, ticket);
            },
          ),
        ],
      ),
    );
  }
}
