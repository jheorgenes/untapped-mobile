import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/models/event_model.dart';
import '../../../core/widgets_ui/event_item_widget.dart';

class HighlightsEvents extends StatelessWidget {
  final List _events;

  const HighlightsEvents({Key? key, required List events})
      : _events = events,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.symmetric(horizontal: 30),
      // height: 288,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Eventos',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
            width: context.width,
            height: context.height,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  ..._events.map((event) {
                    final eventModel = event as EventModel;
                    return EventItemWidget(
                      event: eventModel,
                    );
                  }),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
