import 'package:flux_validator_dart/flux_validator_dart.dart';

mixin Validators {
  bool cepValid(String cep) {
    return Validator.cep(cep);
  }
}
