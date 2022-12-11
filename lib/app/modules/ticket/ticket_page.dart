import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:untapped/app/core/models/event_model.dart';
import 'package:untapped/app/core/widgets_ui/ticket_detail_widget.dart';
import '../../core/widgets_ui/app_bar_navigator.dart';
import './ticket_controller.dart';

class TicketPage extends GetView<TicketController> {
  const TicketPage({super.key});

  @override
  Widget build(BuildContext context) {
    final params = ModalRoute.of(context)!.settings.arguments as Map;
    final ticketsOrder = params['data']['ticketsOrder'] as List;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBarNavigator(
        title: 'E-Ticket',
        showIcon: false,
        color: Theme.of(context).backgroundColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(10),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))),
        ),
        onPressed: () {
          // showMaterialModalBottomSheet(
          //   barrierColor: Colors.transparent,
          //   context: context,
          //   clipBehavior: Clip.none,
          //   shape: const RoundedRectangleBorder(
          //     borderRadius: BorderRadius.only(
          //       topLeft: Radius.circular(15),
          //       topRight: Radius.circular(15),
          //     ),
          //   ),
          //   builder: (context) => CompletedOrderBottomSheet(
          //     message: 'Seu ticket foi baixado com sucesso',
          //     icon: Image.asset('assets/images/icon-downloaded.png'),
          //     subtitle: '',
          //     buttomCallback: () {
          //       Get.offAllNamed('/home');
          //     },
          //     titleButtom: 'Home',
          //   ),
          // );
          Get.offNamed('/home');
        },
        child: SizedBox(
          height: 35,
          width: context.widthTransformer(reducedBy: 20),
          child: const Center(
            child: Text(
              'Início',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            const Text(
              'O que fazer?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                controller.messageHelp,
                style: const TextStyle(
                  fontWeight: FontWeight.w300,
                  // fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            FutureBuilder(
              future: controller.loadEvent(params['data']['eventId']),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final eventModel = snapshot.data as EventModel;
                  return Column(
                    children: [
                      ...ticketsOrder.map(
                        (order) {
                          var widget = TicketDetailWidget(
                            order: order,
                            eventModel: eventModel,
                          );

                          return widget;
                        },
                      ).toList(),
                    ],
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            const SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
    );
  }
}
