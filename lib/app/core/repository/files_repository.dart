import '../rest_client/rest_client.dart';

abstract class IFilesRepositoty {
  Future store(data);
}

class FilesRepository implements IFilesRepositoty {
  final RestClient _restClient;

  FilesRepository({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future store(data) async {
    var response = await _restClient.post('/api/file/v1/uploadFile', data);

    return response.body;
  }
}
