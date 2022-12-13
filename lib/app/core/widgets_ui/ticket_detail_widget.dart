import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:untapped/app/core/models/event_model.dart';
import 'package:untapped/app/modules/ticket/widget/divider_widget.dart';

class TicketDetailWidget extends StatelessWidget {
  final Map order;
  final EventModel? eventModel;

  const TicketDetailWidget({
    super.key,
    required this.order,
    this.eventModel,
  });

  @override
  Widget build(BuildContext context) {
    final ticket = order['ticket'];
    final eventName = ticket['event']?['title'] ?? '';
    final qrCode = order['qrCode'] ?? 0;
    DateTime tempDate =
        DateFormat("dd/MM/yyyy HH:mm").parse('${ticket['expirationDate']}');
    String date = DateFormat('dd/MM/yyyy').format(tempDate);
    String time = DateFormat('HH:mm').format(tempDate);

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Center(
        child: Container(
          width: context.widthTransformer(reducedBy: 10),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(11)),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Text(
                          '${ticket['description']}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                        const Spacer(),
                        const Text(
                          'e-ticket',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Color(0XFFF14763),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: const [
                        Text(
                          'Data',
                          style: TextStyle(
                            color: Color(0XFF717171),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          date,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: const [
                        Text(
                          'Local',
                          style: TextStyle(
                            color: Color(0XFF717171),
                          ),
                        ),
                        Spacer(),
                        Text(
                          'Horário',
                          style: TextStyle(
                            color: Color(0XFF717171),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        if (eventModel != null)
                          Text(
                            eventModel?.addressModel?.title ?? '',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        const Spacer(),
                        Text(
                          time,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: const [
                        Text(
                          'Título do evento',
                          style: TextStyle(
                            color: Color(0XFF717171),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          eventName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: const [
                        Text(
                          'Pagamento',
                          style: TextStyle(
                            color: Color(0XFF717171),
                          ),
                        ),
                        Spacer(),
                        Text(
                          'Order',
                          style: TextStyle(
                            color: Color(0XFF717171),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Efetuado',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '${order['id']}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const DividerWidget(),
              Center(
                child: QrImage(
                  data: '$qrCode',
                  version: QrVersions.auto,
                  size: 150,
                  gapless: false,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
