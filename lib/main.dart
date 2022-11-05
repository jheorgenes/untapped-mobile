import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'app/app_page.dart';

void main() async {
  await GetStorage.init();

  WidgetsFlutterBinding.ensureInitialized();

  runApp(const AppPage());
}
