import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:untapped/app/core/widgets_ui/text_form_field_ui.dart';
import 'package:untapped/app/modules/events/widgets/highlights_events.dart';
import './events_controller.dart';

class EventsPage extends GetView<EventsController> {
  EventsPage({super.key});
  var hasLoaded = false;

  @override
  Widget build(BuildContext context) {
    if (!hasLoaded) {
      hasLoaded = true;
      controller.loadEvents();
    }
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormFieldUi(
                  focusNode: controller.focusNode,
                  title: 'Pesquisar evento por nome',
                  onChanged: (value) {
                    if (value != null && value.length > 3) {
                      controller.findEventsByName(value);
                    } else {
                      controller.loadEvents();
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Obx(() {
                return controller.loading.value
                    ? SizedBox(
                        height: context.heightTransformer(reducedBy: 50),
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : HighlightsEvents(
                        events: controller.events,
                      );
              }),
              const SizedBox(
                height: 30,
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 30),
              //   child: Row(
              //     children: const [
              //       Text(
              //         'Perto de Você',
              //         style: TextStyle(
              //           color: Colors.white,
              //           fontFamily: 'Poppins',
              //           fontSize: 19,
              //           fontWeight: FontWeight.w600,
              //         ),
              //       ),
              //       Spacer(),
              //       Text(
              //         'Todos',
              //         style: TextStyle(
              //           color: Color(0XFF696D74),
              //           fontFamily: 'Poppins',
              //           fontSize: 17,
              //           fontWeight: FontWeight.w300,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // const SizedBox(
              //   height: 12,
              // ),
              // ...List.generate(6, (index) => const EventItem()).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
