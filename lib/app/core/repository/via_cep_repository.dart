import 'package:get/get.dart';

abstract class IViaCepRepository {
  Future show(cep);
}

class ViaCepRepository implements IViaCepRepository {
  final GetConnect _getConnect = GetConnect();

  ViaCepRepository();

  @override
  Future show(cep) async {
    var response = await _getConnect.get('https://viacep.com.br/ws/$cep/json/');
    return response.body;
  }
}
