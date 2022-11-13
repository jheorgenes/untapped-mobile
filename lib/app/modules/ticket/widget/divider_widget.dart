import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 20,
          height: 40,
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
        ),
//         Container(
//           width: context.width,
//           height: 1,
// decoration: BoxDecoration(
//   border: Border.all(width: 1,style: BorderStyle. )
// ),
//         ),

        Expanded(
          child: SizedBox(
            height: 16,
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  MediaQuery.of(context).size.width ~/ (10 + 5),
                  (_) => Container(
                    width: 5,
                    height: 2,
                    color: Colors.black,
                    margin: const EdgeInsets.only(left: 10 / 2, right: 5 / 2),
                  ),
                ),
              ),
            ),
          ),
        ),
        Container(
          width: 20,
          height: 40,
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50),
              bottomLeft: Radius.circular(50),
            ),
          ),
        )
      ],
    );
  }
}
