import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../core/widgets_ui/app_bar_navigator.dart';
import './manager_events_controller.dart';

class ManagerEventsPage extends GetView<ManagerEventsController> {
  const ManagerEventsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBarNavigator(
        title: 'Gerenciar eventos',
        showIcon: false,
        color: Theme.of(context).backgroundColor,
      ),
      body: Container(),
    );
  }
}
