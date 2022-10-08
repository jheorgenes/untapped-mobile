import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untapped/app/modules/event_detail/widgets/ticket_type_widget.dart';

class ChooseTicketBottomSheet extends StatelessWidget {
  const ChooseTicketBottomSheet({Key? key}) : super(key: key);

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
              const TicketTypeWidget(
                price: 100,
                title: 'Vip Lounge Gold',
              ),
              const SizedBox(
                height: 5,
              ),
              const TicketTypeWidget(
                price: 100,
                title: 'Vip Lounge Gold',
              ),
              const SizedBox(
                height: 5,
              ),
              const TicketTypeWidget(
                price: 100,
                title: 'Vip Lounge Gold',
              ),
              const SizedBox(
                height: 5,
              ),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(10),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                ),
                onPressed: () {
                  Get.toNamed('/checkout', arguments: {});
                },
                child: SizedBox(
                  height: 25,
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
