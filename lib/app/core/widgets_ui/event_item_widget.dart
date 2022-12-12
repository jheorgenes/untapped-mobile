import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:untapped/app/core/models/event_model.dart';

import '../constants/constants.dart';

class EventItemWidget extends StatelessWidget {
  final EventModel event;

  const EventItemWidget({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    var inputFormat = DateFormat('dd/MM/yyyy HH:mm').parse(event.dateEntry);
    var date = DateFormat("MMMM y", 'pt_BR').format(inputFormat);
    return GestureDetector(
      onTap: () {
        Get.toNamed('/events/detail', arguments: event);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: context.width,
            height: 180,
            clipBehavior: Clip.hardEdge,
            margin: const EdgeInsets.only(right: 10),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: event.frontCover != null
                ? Image.network(
                    alignment: Alignment.centerLeft,
                    Constants.IMAGES_URL + event.frontCover!,
                  )
                : Image.asset(
                    'assets/images/no-image.jpeg',
                    fit: BoxFit.fill,
                  ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            event.title,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            date,
            style: const TextStyle(
              color: Color(0XFFAFAFAF),
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
