import 'package:flutter/material.dart';
import 'package:untapped/app/modules/discover/widgets/event_category_item_widget.dart';

class HighlightsCategoryWidget extends StatelessWidget {
  final Map category;
  const HighlightsCategoryWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final events = category['events'] as List;
    return events.isNotEmpty
        ? Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 41),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      category['description'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    // const Text(
                    //   'Todos',
                    //   style: TextStyle(
                    //     color: Color(0XFF696D74),
                    //     fontFamily: 'Poppins',
                    //     fontSize: 17,
                    //     fontWeight: FontWeight.w300,
                    //   ),
                    // ),
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
                        ...events.map(
                          (e) {
                            return EventCategoryItemWidget(event: e);
                          },
                        ).toList()
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        : Container();
  }
}
