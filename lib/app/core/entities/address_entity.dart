class AddressEntity {
  int? id;
  String street;
  String? title;
  String district;
  String addressComplement;
  String? addressNumber;
  String? cep;
  String city;
  String state;
  String country;
  String? latitude;
  String? longitude;

  AddressEntity({
    this.id,
    required this.street,
    required this.district,
    required this.addressComplement,
    this.title,
    this.addressNumber,
    this.cep,
    required this.state,
    required this.city,
    required this.country,
    this.latitude,
    this.longitude,
  });
}
