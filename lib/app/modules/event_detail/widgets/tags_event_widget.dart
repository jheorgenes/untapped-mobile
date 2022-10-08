import 'package:flutter/material.dart';

class TagsEventWidget extends StatelessWidget {
  const TagsEventWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            child: const Center(
              child: Text(
                '02h 43m',
                style: TextStyle(
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
