import 'dart:convert';

import 'package:untapped/app/core/entities/event_entity.dart';
import 'package:untapped/app/core/models/address_model.dart';

import 'ticket_model.dart';

class EventModel extends EventEntity {
  @override
  int? id;
  @override
  int userId;
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
  AddressModel? addressModel;
  @override
  List categories;
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
    this.addressModel,
    this.capacity,
    this.categories = const [],
    this.description,
    this.tickets,
    required this.userId,
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
          categories: categories,
          userId: userId,
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
      'addressEntity': addressModel?.toMap(),
      'capacity': capacity,
      'categories': categories,
      'userId': userId,
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

    var address =
        map['address'] != null ? AddressModel.fromMap(map['address']) : null;

    return EventModel(
      id: map['id']?.toInt(),
      userId: map['userId'].toInt(),
      title: map['title'] ?? '',
      subTitle: map['subTitle'] ?? '',
      dateEntry: map['dateEntry'] ?? '',
      deadline: map['deadline'] ?? '',
      photos: map['photos'] ?? '',
      description: map['description'],
      media: map['media'] ?? '',
      frontCover: map['frontCover'] ?? '',
      addressModel: address,
      capacity: map['capacity']?.toInt() ?? 0,
      tickets: tickets,
      categories: map['categories'] ?? [],
    );
  }

  String toJson() => json.encode(toMap());

  factory EventModel.fromJson(String source) =>
      EventModel.fromMap(json.decode(source));
}
