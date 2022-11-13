import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CountSelectWidget extends StatefulWidget {
  final Function(int count) onChangeCount;

  const CountSelectWidget({super.key, required this.onChangeCount});

  @override
  State<CountSelectWidget> createState() => _CountSelectWidgetState();
}

class _CountSelectWidgetState extends State<CountSelectWidget> {
  int _countTicket = 0;

  addTicket() {
    setState(() {
      _countTicket++;
      widget.onChangeCount(_countTicket);
    });
  }

  removeTicket() {
    if (_countTicket > 0) {
      setState(() {
        _countTicket--;
        widget.onChangeCount(_countTicket);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          ElevatedButton(
            onPressed: removeTicket,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(10),
              minimumSize: Size.zero, // Set this
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: const FaIcon(
              FontAwesomeIcons.minus,
              color: Colors.white,
              size: 15,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Container(
            width: 32,
            height: 28,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.white),
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: Center(
              child: Text(
                '$_countTicket',
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          ElevatedButton(
            onPressed: addTicket,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(10),
              minimumSize: Size.zero, // Set this
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: const FaIcon(
              FontAwesomeIcons.plus,
              color: Colors.white,
              size: 15,
            ),
          ),
        ],
      ),
    );
  }
}
