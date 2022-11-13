import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TagsEventWidget extends StatelessWidget {
  final String dateEntry;
  final String deadline;

  const TagsEventWidget({
    super.key,
    required this.dateEntry,
    required this.deadline,
  });

  @override
  Widget build(BuildContext context) {
    var dateEntryDate = DateFormat('dd/MM/yyyy HH:mm').parse(dateEntry);
    var deadlineDate = DateFormat('dd/MM/yyyy HH:mm').parse(deadline);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 100,
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Color(0XFF252932),
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: const Center(
              child: Text(
                'Sertanejo',
                style: TextStyle(
                  color: Color(0XFFB2B5BB),
                ),
              ),
            ),
          ),
          Container(
            width: 100,
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Color(0XFF252932),
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: const Center(
              child: Text(
                'Ao vivo',
                style: TextStyle(
                  color: Color(0XFFB2B5BB),
                ),
              ),
            ),
          ),
          Container(
            width: 100,
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Color(0XFF252932),
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Center(
              child: Text(
                deadlineDate.difference(dateEntryDate).inHours.toString(),
                style: const TextStyle(
                  color: Color(0XFFB2B5BB),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
