import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untapped/app/core/repository/events_repository.dart';

class EventsController extends GetxController {
  final IEventsRepositoty _eventsRepository;
  final _events = [].obs;
  final loading = false.obs;
  FocusNode focusNode = FocusNode();
  List get events => _events.value;

  EventsController({
    required IEventsRepositoty eventsRepository,
  }) : _eventsRepository = eventsRepository;

  loadEvents() async {
    log('chamou');
    loading.value = true;
    var response = await _eventsRepository.list();
    loading.value = false;
    _events.value = response;
    focusNode.unfocus();
  }

  findEventsByName(String value) async {
    loading.value = true;
    log('chamou');
    var response = await _eventsRepository.search(value);
    loading.value = false;
    focusNode.unfocus();
    _events.value = response;
  }

  debounceCustom(Function callback) {
    Timer? debounce;
    if (debounce?.isActive ?? false) debounce!.cancel();
    debounce = Timer(
      const Duration(milliseconds: 1500),
      () => callback(),
    );
  }
}
