import 'package:flutter/material.dart';
import 'package:untapped/app/modules/event_detail/widgets/count_select_widget.dart';

class TicketTypeWidget extends StatelessWidget {
  final double price;
  final String title;

  const TicketTypeWidget({
    Key? key,
    required this.price,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 64,
      padding: const EdgeInsets.all(14),
      decoration: const BoxDecoration(
        color: Color(0XFF1A1C1F),
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 43,
            height: 36,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.white),
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                price.toString(),
                style: const TextStyle(color: Colors.white),
              ),
              Text(
                title,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
          const Spacer(),
          const CountSelectWidget(),
        ],
      ),
    );
  }
}
