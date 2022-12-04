import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './discover_controller.dart';
import 'package:untapped/app/modules/discover/widgets/highlights_category.dart';
import 'package:untapped/app/modules/discover/widgets/recommendations.dart';

class DiscoverPage extends GetView<DiscoverController> {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
      ),
      child: SingleChildScrollView(
          child: Container(
        width: context.width,
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: const [
              // Obx(() {
              //   return ToggleModeWidget(
              //     isNow: controller.isNow,
              //     toggleIsNow: (bool value) {
              //       controller.isNow = value;
              //     },
              //   );
              // }),
              HighlightsCategory(),
              SizedBox(
                height: 41,
              ),
              Recommendations(),
            ],
          ),
        ),
      )),
    );
  }
}
