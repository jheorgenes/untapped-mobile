import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './discover_controller.dart';
import 'package:untapped/app/modules/discover/widgets/highlights_category_widget.dart';

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
          child: FutureBuilder(
            future: controller.loadCategories(),
            builder: (context, snapchot) {
              if (snapchot.hasData) {
                final data = snapchot.data as List;
                return Column(
                  children: [
                    // Obx(() {
                    //   return ToggleModeWidget(
                    //     isNow: controller.isNow,
                    //     toggleIsNow: (bool value) {
                    //       controller.isNow = value;
                    //     },
                    //   );
                    // }),

                    ...data.map((item) {
                      return HighlightsCategoryWidget(
                        category: item,
                      );
                    }).toList(),

                    const SizedBox(
                      height: 41,
                    ),
                    // const Recommendations(),
                  ],
                );
              } else {
                return SizedBox(
                  width: context.width,
                  height: context.heightTransformer(reducedBy: 40),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          ),
        ),
      )),
    );
  }
}
