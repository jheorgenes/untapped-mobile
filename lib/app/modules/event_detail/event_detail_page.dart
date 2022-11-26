import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:untapped/app/core/constants/constants.dart';
import 'package:untapped/app/core/models/event_model.dart';
import 'package:untapped/app/modules/event_detail/widgets/choose_ticket_bottom_sheet.dart';
import 'package:untapped/app/modules/event_detail/widgets/description_event_widget.dart';
import 'package:untapped/app/modules/event_detail/widgets/location_detail_event_widget.dart';
import 'package:untapped/app/modules/event_detail/widgets/tags_event_widget.dart';
import '../../core/widgets_ui/app_bar_navigator.dart';
import './event_detail_controller.dart';

class EventDetailPage extends GetView<EventDetailController> {
  const EventDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final params = ModalRoute.of(context)!.settings.arguments as EventModel;

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: context.heightTransformer(reducedBy: 50),
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: const [],
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: params.frontCover != null
                    ? Image.network(Constants.IMAGES_URL + params.frontCover!)
                        .image
                    : const ExactAssetImage(
                        'assets/images/no-image.jpeg',
                      ),
              ),
            ),
            child: Stack(
              children: [
                Container(
                  decoration:
                      BoxDecoration(color: Colors.black.withOpacity(.5)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(),
                        Text(
                          params.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          children: [
                            if (params.addressModel.title != null)
                              Text(
                                'Local: ${params.addressModel.title}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            const Spacer(),
                            // ElevatedButton(
                            //   onPressed: () {},
                            //   style: ElevatedButton.styleFrom(
                            //     side: const BorderSide(
                            //       width: 2,
                            //       color: Colors.white,
                            //     ),
                            //     shadowColor: Colors.transparent,
                            //     backgroundColor: Colors.transparent,
                            //     shape: const CircleBorder(),
                            //   ),
                            //   child: const FaIcon(
                            //     FontAwesomeIcons.play,
                            //     size: 18,
                            //   ),
                            // )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const AppBarNavigator(
                  title: 'Informações',
                  showIcon: true,
                  color: Colors.transparent,
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: context.heightTransformer(reducedBy: 50),
            decoration: const BoxDecoration(
              color: Color(0XFF1B1E25),
            ),
            child: SizedBox(
              width: double.infinity,
              height: context.heightTransformer(reducedBy: 45),
              child: Column(
                children: [
                  TagsEventWidget(
                      dateEntry: params.dateEntry, deadline: params.deadline),
                  const SizedBox(
                    height: 20,
                  ),
                  LocationDetailEventWidget(
                    addressModel: params.addressModel,
                    dateEntry: params.dateEntry,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  DescriptionEventWidget(
                    description: params.description!,
                  ),
                  const Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(10),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                    ),
                    onPressed: () {
                      showMaterialModalBottomSheet(
                        context: context,
                        clipBehavior: Clip.none,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                        ),
                        builder: (context) => ChooseTicketBottomSheet(
                          tickets: params.tickets!,
                        ),
                      );
                    },
                    child: SizedBox(
                      height: 35,
                      width: context.widthTransformer(reducedBy: 20),
                      child: const Center(
                        child: Text(
                          'Comprar Ingresso',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
