import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HighlightsCategory extends StatelessWidget {
  const HighlightsCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Text(
                'Só rock',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              Text(
                'Todos',
                style: TextStyle(
                  color: Color(0XFF696D74),
                  fontFamily: 'Poppins',
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 17,
          ),
          SizedBox(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(
                    10,
                    (index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: context.widthTransformer(reducedBy: 50),
                          height: 250,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: const BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              )),
                        ),
                        const Text(
                          'Cabaré - Ao vivo MA',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    )
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
