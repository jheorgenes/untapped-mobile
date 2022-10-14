import 'package:flutter/material.dart';

class DescriptionEventWidget extends StatelessWidget {
  String description;
  DescriptionEventWidget({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sobre',
              style: TextStyle(
                color: Color(0XFFB2B5BB),
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              description,
              maxLines: 3,
              style: const TextStyle(
                color: Color(0XFFB2B5BB),
              ),
            )
          ],
        ),
      ),
    );
  }
}
