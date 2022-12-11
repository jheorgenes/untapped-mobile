import 'package:get/route_manager.dart';
import 'package:untapped/app/modules/categories/categories_bindings.dart';
import 'package:untapped/app/modules/categories/categories_page.dart';
import 'package:untapped/app/modules/create_event/create_event_bindings.dart';
import 'package:untapped/app/modules/create_event/create_event_page.dart';
import 'package:untapped/app/modules/event_detail/event_detail_bindings.dart';
import 'package:untapped/app/modules/event_detail/event_detail_page.dart';
import 'package:untapped/app/modules/manager_events/manager_events_bindings.dart';
import 'package:untapped/app/modules/manager_events/manager_events_page.dart';

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
      page: () => const CreateEventPage(),
    ),
    GetPage(
      name: '/category/create',
      binding: CategoriesBindings(),
      page: () => CategoriesPage(),
    ),
    GetPage(
      name: '/manager_events',
      binding: ManagerEventsBindings(),
      page: () => const ManagerEventsPage(),
    ),
  ];
}
