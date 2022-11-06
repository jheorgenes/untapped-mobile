import 'package:get/route_manager.dart';
import 'package:untapped/app/modules/create_event/create_event_bindings.dart';
import 'package:untapped/app/modules/create_event/create_event_page.dart';
import 'package:untapped/app/modules/event_detail/event_detail_bindings.dart';
import 'package:untapped/app/modules/event_detail/event_detail_page.dart';

class EventRoutes {
  EventRoutes._();

  static final routes = <GetPage>[
    GetPage(
      name: '/events/detail',
      binding: EventDetailBindings(),
      page: () => const EventDetailPage(),
    ),
    GetPage(
      name: '/events/create',
      binding: CreateEventBindings(),
      page: () => CreateEventPage(),
    )
  ];
}
