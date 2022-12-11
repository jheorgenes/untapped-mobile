import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:untapped/app/core/models/event_model.dart';
import 'package:untapped/app/core/widgets_ui/event_item_widget.dart';
import '../../core/widgets_ui/app_bar_navigator.dart';
import './manager_events_controller.dart';

class ManagerEventsPage extends GetView<ManagerEventsController> {
  const ManagerEventsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBarNavigator(
        title: 'Meus eventos',
        showIcon: false,
        color: Theme.of(context).backgroundColor,
      ),
      body: Container(
        width: context.width,
        height: context.height,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: FutureBuilder(
            future: controller.loadMyEvents(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var events = snapshot.data as List<EventModel>;
                return ListView.builder(
                  itemCount: events.length,
                  itemBuilder: (context, index) {
                    return EventItemWidget(event: events[index]);
                  },
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
