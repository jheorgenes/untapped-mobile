import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:untapped/app/core/repository/category_repository.dart';
import 'package:untapped/app/core/repository/events_repository.dart';
import 'package:untapped/app/core/repository/files_repository.dart';
import 'package:untapped/app/core/repository/via_cep_repository.dart';
import 'package:untapped/app/core/services/auth_service.dart';
import 'package:untapped/app/core/services/loader_mixin.dart';

class CreateEventController extends GetxController with LoaderMixin {
  final IEventsRepositoty _eventsRepositoty;
  final IViaCepRepository _viaCepRepository;
  final IFilesRepositoty _filesRepositoty;
  final ICategoryRepositoty _categoryRepositoty;
  final AuthService authService;
  var loading = false.obs;
  var data = {};
  var modal = false.obs;
  String fileNameUpload = '';

  CreateEventController(
    this._eventsRepositoty,
    this._viaCepRepository,
    this._filesRepositoty,
    this._categoryRepositoty,
    this.authService,
  );

  submitedForm() async {
    loading(true);

    try {
      var result = await _eventsRepositoty.store(data);

      Timer(const Duration(seconds: 1), () {
        loading(false);
        modal(true);
        Timer(const Duration(seconds: 1), () {
          modal(false);

          Get.offAllNamed('/home');
        });
      });
    } catch (e) {
      loading(false);
      Get.defaultDialog(
        content: const Center(child: Text('Erro ao criar evento')),
      );
    }
  }

  updateForm(id) async {
    loading(true);

    try {
      var result = await _eventsRepositoty.update(data, id);

      Timer(const Duration(seconds: 1), () {
        loading(false);
        modal(true);
        Timer(const Duration(seconds: 1), () {
          modal(false);
          Get.offAllNamed('/home');
        });
      });
    } catch (e) {
      var ex = e as Exception;
      loading(false);
      Get.defaultDialog(
        content: Center(
            child: Column(
          children: const [
            Text('Erro ao atualizar evento'),
            SizedBox(
              height: 10,
            ),
          ],
        )),
      );
    }
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
