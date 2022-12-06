import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untapped/app/core/models/event_model.dart';
import 'package:untapped/app/core/widgets_ui/elevated_button_ui.dart';

import '../../../core/constants/constants.dart';

class EventCategoryItemWidget extends StatelessWidget {
  final Map<String, dynamic> event;
  const EventCategoryItemWidget({
    super.key,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButtonUi(
      borderRadius: 10,
      backgroundColor: Colors.transparent,
      callback: () {
        var eventModel = EventModel.fromMap(event);
        Get.toNamed('/events/detail', arguments: eventModel);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: context.widthTransformer(reducedBy: 50),
              constraints: const BoxConstraints(
                maxHeight: 250,
              ),
              margin: const EdgeInsets.only(right: 10),
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: event['frontCover'] != null
                  ? Image.network(
                      fit: BoxFit.fill,
                      Constants.IMAGES_URL + event['frontCover']!,
                    )
                  : Image.asset(
                      'assets/images/no-image.jpeg',
                      fit: BoxFit.fill,
                    ),
            ),
            const SizedBox(
              height: 10,
            ),
            AutoSizeText(
              event['title'],
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Poppins',
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
