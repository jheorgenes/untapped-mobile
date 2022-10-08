import 'package:get/get_connect/connect.dart';

class RestClient extends GetConnect {
  final _backendBaseUrl = 'http://localhost:8080';

  RestClient() {
    httpClient.baseUrl = _backendBaseUrl;
  }
}
