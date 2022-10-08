import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:untapped/app/core/widgets_ui/text_form_field_ui.dart';
import 'package:untapped/app/modules/events/widgets/event_item.dart';
import 'package:untapped/app/modules/events/widgets/highlights_events.dart';
import './events_controller.dart';

class EventsPage extends GetView<EventsController> {
  const EventsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.loadEvents();
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
      ),
      child: SingleChildScrollView(
        child: Container(
          width: context.width,
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
          ),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: TextFormFieldUi(),
              ),
              const SizedBox(
                height: 30,
              ),
              Obx(() {
                return HighlightsEvents(events: controller.events);
              }),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: const [
                    Text(
                      'Perto de Você',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'Todos',
                      style: TextStyle(
                        color: Color(0XFF696D74),
                        fontFamily: 'Poppins',
                        fontSize: 17,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              ...List.generate(6, (index) => const EventItem()).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
