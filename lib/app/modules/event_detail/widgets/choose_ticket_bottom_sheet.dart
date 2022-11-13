import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untapped/app/core/models/ticket_model.dart';
import 'package:untapped/app/modules/event_detail/widgets/ticket_type_widget.dart';

class ChooseTicketBottomSheet extends StatefulWidget {
  final List<TicketModel> tickets;

  const ChooseTicketBottomSheet({
    super.key,
    required this.tickets,
  });

  @override
  State<ChooseTicketBottomSheet> createState() =>
      _ChooseTicketBottomSheetState();
}

class _ChooseTicketBottomSheetState extends State<ChooseTicketBottomSheet> {
  final List<Map<String, dynamic>> selectedTickets = [];

  _updateListTicket(TicketModel ticket, int count) {
    var index = selectedTickets.indexWhere((item) {
      return item['ticket'] == ticket;
    });

    if (index != -1) {
      if (count == 0) {
        selectedTickets.removeAt(index);
      } else {
        selectedTickets[index]['quantity'] = count;
      }
    } else if (count > 0) {
      selectedTickets.add({
        'ticket': ticket,
        'quantity': count,
      });
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        clipBehavior: Clip.none,
        width: double.infinity,
        height: context.heightTransformer(reducedBy: 40),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          color: Color(0XFF242526),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Escolha seus ingressos',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ...widget.tickets
                  .map(
                    (e) => TicketTypeWidget(
                      ticket: e,
                      onSelectedTicket: (count, ticket) {
                        _updateListTicket(ticket, count);
                      },
                    ),
                  )
                  .toList(),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      selectedTickets.isNotEmpty ? null : Colors.grey,
                  padding: const EdgeInsets.all(10),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                ),
                onPressed: () {
                  if (selectedTickets.isNotEmpty) {
                    Get.toNamed('/checkout', arguments: selectedTickets);
                  }
                },
                child: SizedBox(
                  height: 35,
                  width: context.widthTransformer(reducedBy: 20),
                  child: const Center(
                    child: Text(
                      'Escolher',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
