import 'package:flutter/material.dart';

class DescriptionEventWidget extends StatelessWidget {
  const DescriptionEventWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          Container(
            child: const Text(
              'No não Qual importante é read carbs que mais bois Os Antes propósito. vale andou elefante O vai panda. golfinho? No não Qual importante é read carbs que mais bois Os Antes ',
              style: TextStyle(
                color: Color(0XFFB2B5BB),
              ),
            ),
          )
        ],
      ),
    );
  }
}
