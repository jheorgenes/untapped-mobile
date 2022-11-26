import 'dart:convert';
import 'dart:developer';

import 'package:untapped/app/core/entities/event_entity.dart';
import 'package:untapped/app/core/models/address_model.dart';

import 'ticket_model.dart';

class EventModel extends EventEntity {
  @override
  int? id;
  @override
  String title;
  @override
  String? subTitle;
  @override
  String? description;
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
  List<TicketModel>? tickets;
  @override
  int? capacity;

  EventModel({
    required this.id,
    required this.title,
    this.subTitle,
    required this.dateEntry,
    required this.deadline,
    this.photos,
    this.frontCover,
    this.media,
    required this.addressModel,
    this.capacity,
    this.description,
    this.tickets,
  }) : super(
          id: id,
          title: title,
          description: description,
          subTitle: subTitle,
          dateEntry: dateEntry,
          deadline: deadline,
          addressEntity: addressModel,
          capacity: capacity,
          photos: photos,
          frontCover: frontCover,
          media: media,
          tickets: tickets,
        );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'subTitle': subTitle,
      'dateEntry': dateEntry,
      'deadline': deadline,
      'photos': photos,
      'description': description,
      'media': media,
      'frontCover': frontCover,
      'addressEntity': addressModel.toMap(),
      'capacity': capacity,
    };
  }

  factory EventModel.fromMap(Map<String, dynamic> map) {
    List? ticke;
    List<TicketModel>? tickets;
    if (map['tickets'] != null) {
      ticke = map['tickets'];
      tickets = ticke!.map((e) {
        e['eventId'] = map['id']?.toInt();

        return TicketModel.fromMap(e!);
      }).toList();
    }
    log('ol');

    return EventModel(
      id: map['id']?.toInt(),
      title: map['title'] ?? '',
      subTitle: map['subTitle'] ?? '',
      dateEntry: map['dateEntry'] ?? '',
      deadline: map['deadline'] ?? '',
      photos: map['photos'],
      description: map['description'],
      media: map['media'],
      frontCover: map['frontCover'],
      addressModel: AddressModel.fromMap(map['address']),
      capacity: map['capacity']?.toInt() ?? 0,
      tickets: tickets,
    );
  }

  String toJson() => json.encode(toMap());

  factory EventModel.fromJson(String source) =>
      EventModel.fromMap(json.decode(source));
}
