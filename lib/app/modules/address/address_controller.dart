import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:untapped/app/core/repository/address_repository.dart';

import '../../core/repository/via_cep_repository.dart';
import '../../core/services/auth_service.dart';

class AddressController extends GetxController {
  final IViaCepRepository _viaCepRepository;
  final IAddressRepository _addressRepository;
  final AuthService authService;
  Map<String, dynamic> data = {};

  AddressController(
      this._viaCepRepository, this._addressRepository, this.authService);

  loadCep(cep) async {
    return await _viaCepRepository.show(cep);
  }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    var position = await Geolocator.getCurrentPosition();

    return position;
  }

  submit({required bool modeCreate, int? addressId}) async {
    if (modeCreate) {
      var result = await _addressRepository.create(data);
      return result;
    } else {
      var result = await _addressRepository.update(data, addressId!);
      return result;
    }
  }
}
