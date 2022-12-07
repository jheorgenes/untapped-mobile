import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';
import 'package:untapped/app/core/repository/category_repository.dart';
import 'package:untapped/app/core/repository/events_repository.dart';
import 'package:untapped/app/core/repository/files_repository.dart';
import 'package:untapped/app/core/repository/via_cep_repository.dart';
import 'package:untapped/app/core/services/loader_mixin.dart';

class CreateEventController extends GetxController with LoaderMixin {
  final IEventsRepositoty _eventsRepositoty;
  final IViaCepRepository _viaCepRepository;
  final IFilesRepositoty _filesRepositoty;
  final ICategoryRepositoty _categoryRepositoty;
  var loading = false.obs;
  var data = {};
  var modal = false.obs;
  String fileNameUpload = '';

  CreateEventController(
    this._eventsRepositoty,
    this._viaCepRepository,
    this._filesRepositoty,
    this._categoryRepositoty,
  );

  submitedForm() async {
    loading(true);

    await _eventsRepositoty.store(data);
    Timer(const Duration(seconds: 1), () {
      loading(false);
      modal(true);
      Timer(const Duration(seconds: 1), () {
        modal(false);
        Get.offNamed('/home');
      });
    });
  }

  updateForm(id) async {
    loading(true);

    var result = await _eventsRepositoty.update(data, id);
    Timer(const Duration(seconds: 1), () {
      loading(false);
      modal(true);
      Timer(const Duration(seconds: 1), () {
        modal(false);
        Get.offAllNamed('/home');
      });
    });
  }

  loadCep(cep) async {
    return await _viaCepRepository.show(cep);
  }

  loadCategories() async {
    return await _categoryRepositoty.list();
  }

  uploadFile(File file) async {
    var filename = file.path.split("/").last;
    var formData = FormData({
      'file': MultipartFile(
        file,
        filename: filename,
      ),
    });
    var response = await _filesRepositoty.store(formData);
    fileNameUpload = response['fileName'];
    return response;
  }
}
