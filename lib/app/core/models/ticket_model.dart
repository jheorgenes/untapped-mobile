import 'dart:convert';

import 'package:untapped/app/core/entities/ticket_entity.dart';

class TicketModel extends TicketEntity {
  @override
  int? id;
  @override
  String description;
  @override
  double valueTicket;
  @override
  String ticketClassification;
  @override
  String expirationDate;
  @override
  String statusTicket;
  @override
  int numberOfTicketsPerRating;
  int? eventID;

  TicketModel({
    this.id,
    required this.description,
    required this.valueTicket,
    required this.ticketClassification,
    required this.expirationDate,
    required this.statusTicket,
    required this.numberOfTicketsPerRating,
    this.eventID,
  }) : super(
          id: id,
          description: description,
          valueTicket: valueTicket,
          ticketClassification: ticketClassification,
          expirationDate: expirationDate,
          statusTicket: statusTicket,
          numberOfTicketsPerRating: numberOfTicketsPerRating,
          eventId: eventID,
        );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'eventId': eventId,
      'valueTicket': valueTicket,
      'ticketClassification': ticketClassification,
      'expirationDate': expirationDate,
      'statusTicket': statusTicket,
      'numberOfTicketsPerRating': numberOfTicketsPerRating,
    };
  }

  factory TicketModel.fromMap(Map<String, dynamic> map) {
    return TicketModel(
      id: map['id']?.toInt(),
      eventID: map['eventId']?.toInt(),
      description: map['description'] ?? '',
      valueTicket: map['valueTicket']?.toDouble() ?? 0.0,
      ticketClassification: map['ticketClassification'] ?? '',
      expirationDate: map['expirationDate'] ?? '',
      statusTicket: map['statusTicket'] ?? '',
      numberOfTicketsPerRating: map['numberOfTicketsPerRating']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory TicketModel.fromJson(String source) =>
      TicketModel.fromMap(json.decode(source));
}
