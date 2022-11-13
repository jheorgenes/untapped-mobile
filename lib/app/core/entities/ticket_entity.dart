class TicketEntity {
  int? id;
  String description;
  double valueTicket;
  String ticketClassification;
  String expirationDate;
  String statusTicket;
  int numberOfTicketsPerRating;
  int? eventId;

  TicketEntity({
    this.id,
    required this.description,
    required this.valueTicket,
    required this.ticketClassification,
    required this.expirationDate,
    required this.statusTicket,
    required this.numberOfTicketsPerRating,
    this.eventId,
  });
}
