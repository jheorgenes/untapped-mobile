import 'package:untapped/app/core/entities/address_entity.dart';
import 'package:untapped/app/core/models/ticket_model.dart';

class EventEntity {
  int? id;
  String title;
  String? subTitle;
  String dateEntry;
  String deadline;
  String? description;
  String? photos;
  String? media;
  String? frontCover;
  AddressEntity? addressEntity;
  List categories;
  List<TicketModel>? tickets;
  int? capacity;

  EventEntity({
    this.id,
    required this.title,
    this.subTitle,
    required this.dateEntry,
    required this.deadline,
    this.description,
    this.categories = const [],
    this.photos,
    this.media,
    this.frontCover,
    this.addressEntity,
    this.capacity,
    this.tickets,
  });
}
