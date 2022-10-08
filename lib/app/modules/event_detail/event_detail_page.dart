import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
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
    final params = ModalRoute.of(context)!.settings.arguments as Map;

    // print(params['id']!);

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: context.heightTransformer(reducedBy: 50),
                decoration: const BoxDecoration(
                  boxShadow: [],
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: ExactAssetImage(
                      'assets/images/432.png',
                    ),
                  ),
                ),
                child: Container(
                  decoration:
                      BoxDecoration(color: Colors.black.withOpacity(.5)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(),
                        const Text(
                          'Cabaré Show',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          children: [
                            const Text(
                              'Local: Feira de Eventos Gyn',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const Spacer(),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                side: const BorderSide(
                                  width: 2,
                                  color: Colors.white,
                                ),
                                shadowColor: Colors.transparent,
                                backgroundColor: Colors.transparent,
                                shape: const CircleBorder(),
                              ),
                              child: const FaIcon(
                                FontAwesomeIcons.play,
                                size: 18,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
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
          Container(
            width: double.infinity,
            height: context.heightTransformer(reducedBy: 50),
            decoration: const BoxDecoration(
              color: Color(0XFF1B1E25),
            ),
            child: Column(
              children: [
                const TagsEventWidget(),
                const SizedBox(
                  height: 20,
                ),
                const LocationDetailEventWidget(),
                const SizedBox(
                  height: 25,
                ),
                const DescriptionEventWidget(),
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
                      builder: (context) => const ChooseTicketBottomSheet(),
                    );
                  },
                  child: SizedBox(
                    height: 25,
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
          )
        ],
      ),
    );
  }
}
