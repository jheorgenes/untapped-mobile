import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EventItem extends StatelessWidget {
  const EventItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 76,
            height: 76,
            margin: const EdgeInsets.only(bottom: 18),
            decoration: const BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              )
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Icon(
                      FontAwesomeIcons.locationPin,
                      color: Color(0XFF636882),
                      size: 15,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '5,2 Kilometers',
                      style: TextStyle(
                        color: Color(0XFFAFAFAF),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 9,
                ),
                Row(
                  children: const [
                    Text(
                      'Festival de Rock',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 2,
                ),
                Row(
                  children: const [
                    Text(
                      'Acontecendo',
                      style: TextStyle(
                        color: Color(0XFFBABFC9),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}