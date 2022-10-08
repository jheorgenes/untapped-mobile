import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LocationDetailEventWidget extends StatelessWidget {
  const LocationDetailEventWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const FaIcon(
            FontAwesomeIcons.locationPin,
            color: Color(0XFFB2B5BB),
          ),
          const SizedBox(
            width: 6,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(
                width: 150,
                child: Text(
                  'Parque das Araucárias Goiânia - Goiás',
                  style: TextStyle(
                    color: Color(0XFFB2B5BB),
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  FaIcon(
                    FontAwesomeIcons.calendar,
                    color: Color(0XFFB2B5BB),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Data:',
                    style: TextStyle(
                      color: Color(0XFFB2B5BB),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '14/05/2121',
                    style: TextStyle(
                      color: Color(0XFFB2B5BB),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  FaIcon(
                    FontAwesomeIcons.clock,
                    color: Color(0XFFB2B5BB),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Horário:',
                    style: TextStyle(
                      color: Color(0XFFB2B5BB),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '19:00',
                    style: TextStyle(
                      color: Color(0XFFB2B5BB),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
