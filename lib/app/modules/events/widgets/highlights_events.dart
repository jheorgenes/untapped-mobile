import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HighlightsEvents extends StatelessWidget {
  const HighlightsEvents({Key? key}) : super(key: key);

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
                  ...List.generate(
                    10,
                    (index) => GestureDetector(
                      onTap: () {
                        Get.toNamed('/events/detail', arguments: {'id': 1});
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: context.widthTransformer(reducedBy: 30),
                            height: 180,
                            margin: const EdgeInsets.only(right: 10),
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                          const Text(
                            'Cabaré - Ao vivo MA',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Text(
                            'Novembro 2021',
                            style: TextStyle(
                              color: Color(0XFFAFAFAF),
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ).toList(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
