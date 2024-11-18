import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nova_demo/common/language/translation_services.dart';
import 'package:nova_demo/navigation/app_pages.dart';
import 'package:nova_demo/navigation/app_routes.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      getPages: AppPages.routes,
      translationsKeys: TranslationServices().translations,
      locale: const Locale('en', 'US'),
    );
  }
}
