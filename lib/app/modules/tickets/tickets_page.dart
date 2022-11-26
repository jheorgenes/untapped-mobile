import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:untapped/app/core/models/event_model.dart';

import '../../core/widgets_ui/ticket_detail_widget.dart';
import './tickets_controller.dart';

class TicketsPage extends GetView<TicketsController> {
  const TicketsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: FutureBuilder(
        future: controller.loadTicketOrders(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final ticketsOrder = snapshot.data as List;

            return SingleChildScrollView(
              child: Column(
                children: [
                  ...ticketsOrder.map(
                    (order) {
                      final event = order['ticket']['event'];
                      print(event);
                      final eventModel = EventModel.fromMap(event);

                      return TicketDetailWidget(
                        order: order,
                        eventModel: eventModel,
                      );
                    },
                  ).toList(),
                ],
              ),
            );
          } else {
            return const Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
