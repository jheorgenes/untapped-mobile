import 'dart:convert';

import 'package:untapped/app/core/entities/event_entity.dart';
import 'package:untapped/app/core/models/address_model.dart';

class EventModel extends EventEntity {
  @override
  int? id;
  @override
  String title;
  @override
  String subTitle;
  @override
  String dateEntry;
  @override
  String deadline;
  @override
  String? photos;
  @override
  String? media;
  @override
  String? frontCover;
  @override
  AddressModel addressModel;
  @override
  int capacity;

  EventModel({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.dateEntry,
    required this.deadline,
    this.photos,
    this.frontCover,
    this.media,
    required this.addressModel,
    required this.capacity,
  }) : super(
          id: id,
          title: title,
          subTitle: subTitle,
          dateEntry: dateEntry,
          deadline: deadline,
          addressEntity: addressModel,
          capacity: capacity,
          photos: photos,
          frontCover: frontCover,
          media: media,
        );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'subTitle': subTitle,
      'dateEntry': dateEntry,
      'deadline': deadline,
      'photos': photos,
      'media': media,
      'frontCover': frontCover,
      'addressEntity': addressModel.toMap(),
      'capacity': capacity,
    };
  }

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      id: map['id']?.toInt(),
      title: map['title'] ?? '',
      subTitle: map['subTitle'] ?? '',
      dateEntry: map['dateEntry'] ?? '',
      deadline: map['deadline'] ?? '',
      photos: map['photos'],
      media: map['media'],
      frontCover: map['frontCover'],
      addressModel: AddressModel.fromMap(map['address']),
      capacity: map['capacity']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory EventModel.fromJson(String source) =>
      EventModel.fromMap(json.decode(source));
}
