import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:untapped/app/modules/ticket/widget/ticket_detail_widget.dart';
import '../../core/widgets_ui/app_bar_navigator.dart';
import '../../core/widgets_ui/completed_order_bottom_sheet.dart';
import './ticket_controller.dart';

class TicketPage extends GetView<TicketController> {
  const TicketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          showMaterialModalBottomSheet(
            barrierColor: Colors.transparent,
            context: context,
            clipBehavior: Clip.none,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            builder: (context) => CompletedOrderBottomSheet(
              message: 'Seu ticket foi baixado com sucesso',
              iconAsset: 'assets/images/icon-downloaded.png',
              subtitle: '',
              buttomCallback: () {
                Get.offAllNamed('/home');
              },
              titleButtom: 'Home',
            ),
          );
        },
        child: SizedBox(
          height: 35,
          width: context.widthTransformer(reducedBy: 20),
          child: const Center(
            child: Text(
              'Dowload',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
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
            Text(
              controller.messageHelp,
              style: const TextStyle(
                fontWeight: FontWeight.w300,
                // fontSize: 25,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const TicketDetailWidget(),
          ],
        ),
      ),
    );
  }
}
