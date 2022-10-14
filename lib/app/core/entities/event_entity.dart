import 'package:untapped/app/core/entities/address_entity.dart';

class EventEntity {
  int? id;
  String title;
  String subTitle;
  String dateEntry;
  String deadline;
  String description;
  String? photos;
  String? media;
  String? frontCover;
  AddressEntity addressEntity;
  int capacity;

  EventEntity({
    this.id,
    required this.title,
    required this.subTitle,
    required this.dateEntry,
    required this.deadline,
    required this.description,
    this.photos,
    this.media,
    this.frontCover,
    required this.addressEntity,
    required this.capacity,
  });
}
