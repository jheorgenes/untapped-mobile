class AddressEntity {
  int? id;
  String street;
  String district;
  String addressComplement;
  String? addressNumber;
  String? cep;
  String city;
  String country;
  String? latitude;
  String? longitude;

  AddressEntity({
    this.id,
    required this.street,
    required this.district,
    required this.addressComplement,
    this.addressNumber,
    this.cep,
    required this.city,
    required this.country,
    this.latitude,
    this.longitude,
  });
}
