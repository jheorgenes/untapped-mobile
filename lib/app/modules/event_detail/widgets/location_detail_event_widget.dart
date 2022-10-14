import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:untapped/app/core/models/address_model.dart';

class LocationDetailEventWidget extends StatelessWidget {
  AddressModel addressModel;
  String dateEntry;

  LocationDetailEventWidget({
    super.key,
    required this.addressModel,
    required this.dateEntry,
  });

  @override
  Widget build(BuildContext context) {
    var inputFormat = DateFormat('dd/MM/yyyy HH:mm').parse(dateEntry);
    var hour = DateFormat("hh:mm", 'pt_BR').format(inputFormat);
    var date = DateFormat("dd/MM/yyyy", 'pt_BR').format(inputFormat);

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
            children: [
              SizedBox(
                width: 150,
                child: Text(
                  '${addressModel.title ?? ''} ${addressModel.city} - ${addressModel.state}',
                  style: const TextStyle(
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
                children: [
                  const FaIcon(
                    FontAwesomeIcons.calendar,
                    color: Color(0XFFB2B5BB),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    'Data:',
                    style: TextStyle(
                      color: Color(0XFFB2B5BB),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    date,
                    style: const TextStyle(
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
                children: [
                  const FaIcon(
                    FontAwesomeIcons.clock,
                    color: Color(0XFFB2B5BB),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    'Horário:',
                    style: TextStyle(
                      color: Color(0XFFB2B5BB),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    hour,
                    style: const TextStyle(
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
