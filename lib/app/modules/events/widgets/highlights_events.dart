import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:untapped/app/core/constants/constants.dart';

import '../../../core/models/event_model.dart';

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
      height: 288,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Em breve',
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
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ..._events.map((event) {
                    final eventModel = event as EventModel;

                    var inputFormat =
                        DateFormat('dd/MM/yyyy HH:mm').parse(event.dateEntry);
                    var date =
                        DateFormat("MMMM y", 'pt_BR').format(inputFormat);
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed('/events/detail', arguments: eventModel);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: context.widthTransformer(reducedBy: 30),
                            height: 180,
                            clipBehavior: Clip.hardEdge,
                            margin: const EdgeInsets.only(right: 10),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: eventModel.frontCover != null
                                ? Image.network(
                                    Constants.IMAGES_URL +
                                        eventModel.frontCover!,
                                  )
                                : Image.asset(
                                    'assets/images/no-image.jpeg',
                                    fit: BoxFit.fill,
                                  ),
                          ),
                          Text(
                            eventModel.title,
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
                        ],
                      ),
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
