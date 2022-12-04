import 'package:get/get_connect/connect.dart';

class RestClient extends GetConnect {
  final _backendBaseUrl = 'http://192.168.1.3:8082';
  final Map<String, String> headersDefault = {};

  RestClient() {
    httpClient.baseUrl = _backendBaseUrl;
  }

  @override
  Future<Response<T>> get<T>(String url,
      {Map<String, String>? headers,
      String? contentType,
      Map<String, dynamic>? query,
      Decoder<T>? decoder}) {
    return super.get(
      url,
      headers: headersDefault,
    );
  }

  @override
  Future<Response<T>> post<T>(String? url, body,
      {String? contentType,
      Map<String, String>? headers,
      Map<String, dynamic>? query,
      Decoder<T>? decoder,
      Progress? uploadProgress}) {
    // TODO: implement post
    return super.post(
      url,
      body,
      headers: headersDefault,
    );
  }

  @override
  Future<Response<T>> put<T>(String url, body,
      {String? contentType,
      Map<String, String>? headers,
      Map<String, dynamic>? query,
      Decoder<T>? decoder,
      Progress? uploadProgress}) {
    // TODO: implement put
    return super.put(
      url,
      body,
      headers: headersDefault,
    );
  }

  @override
  Future<Response<T>> delete<T>(String url,
      {Map<String, String>? headers,
      String? contentType,
      Map<String, dynamic>? query,
      Decoder<T>? decoder}) {
    // TODO: implement delete
    return super.delete(
      url,
      headers: headersDefault,
    );
  }
}
