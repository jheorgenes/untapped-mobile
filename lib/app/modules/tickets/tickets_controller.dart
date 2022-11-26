import 'package:get/get.dart';
import 'package:untapped/app/core/repository/events_repository.dart';
import 'package:untapped/app/core/repository/order_repository.dart';

class TicketsController extends GetxController {
  final IOrderRepository _orderRepository;
  final IEventsRepositoty _eventsRepositoty;

  TicketsController(
    this._orderRepository,
    this._eventsRepositoty,
  );

  loadOrders() {
    return _orderRepository.list();
  }

  loadTicketOrders() {
    return _orderRepository.ticketsOrders();
  }

  loadEvents() {
    return _eventsRepositoty.list();
  }
}
