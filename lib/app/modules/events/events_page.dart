import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:untapped/app/core/widgets_ui/text_form_field_ui.dart';
import 'package:untapped/app/modules/events/widgets/highlights_events.dart';
import '../../core/services/app_state.dart';
import './events_controller.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends AppState<EventsPage, EventsController> {
  var hasLoaded = false;

  @override
  void reassemble() {
    super.reassemble();
  }

  @override
  void activate() {
    controller.loadEvents();
    super.activate();
  }

  @override
  void initState() {
    controller.loadEvents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                  onSubmited: (value) {
                    if (value != null && value.length > 3) {
                      controller.findEventsByName(value);
                    } else {
                      controller.loadEvents();
                    }
                  },
                  onChanged: (value) {},
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
