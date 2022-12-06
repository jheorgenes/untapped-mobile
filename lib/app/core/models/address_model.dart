import 'dart:convert';

import 'package:untapped/app/core/entities/address_entity.dart';

class AddressModel extends AddressEntity {
  @override
  int? id;
  @override
  String street;
  @override
  String district;
  @override
  String title;
  @override
  String addressComplement;
  @override
  String? addressNumber;
  @override
  String? cep;
  @override
  String city;
  @override
  String state;
  @override
  String country;
  @override
  String? latitude;
  @override
  String? longitude;

  AddressModel({
    this.id,
    required this.street,
    required this.district,
    required this.addressComplement,
    required this.addressNumber,
    required this.cep,
    required this.city,
    required this.country,
    required this.title,
    required this.state,
    this.latitude,
    this.longitude,
  }) : super(
          id: id,
          street: street,
          district: district,
          addressComplement: addressComplement,
          city: city,
          title: title,
          state: state,
          country: country,
          latitude: latitude,
          longitude: longitude,
        );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'street': street,
      'district': district,
      'addressComplement': addressComplement,
      'addressNumber': addressNumber,
      'cep': cep,
      'title': title,
      'state': state,
      'city': city,
      'country': country,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      id: map['id']?.toInt(),
      street: map['street'] ?? '',
      district: map['district'] ?? '',
      addressComplement: map['addressComplement'] ?? '',
      addressNumber: map['addressNumber'] ?? '',
      cep: map['cep'] ?? '',
      title: map['title'] ?? '',
      state: map['state'] ?? '',
      city: map['city'] ?? '',
      country: map['country'] ?? '',
      latitude: map['latitude'] ?? '',
      longitude: map['longitude'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) =>
      AddressModel.fromMap(json.decode(source));
}
