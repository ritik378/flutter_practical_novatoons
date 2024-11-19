import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nova_demo/common/common_logics.dart';
import 'package:nova_demo/common/language/language_string.dart';
import 'package:nova_demo/dashboard/download/download_view.dart';
import 'package:nova_demo/dashboard/favorite/favorite_view.dart';
import 'package:nova_demo/dashboard/home/home_view.dart';
import 'package:nova_demo/dashboard/settings/settings_view.dart';
import 'package:nova_demo/sign_in/sign_in_view.dart';
import 'package:nova_demo/sign_up/sign_up_view.dart';

class DashboardController extends GetxController {
  var currentIndex = 0.obs;
  var titles = [
    LanguageString.home.tr,
    LanguageString.favorite.tr,
    LanguageString.download.tr,
    LanguageString.settings.tr,
  ];

  var icons = [
    Icons.home,
    Icons.favorite,
    Icons.download_done_rounded,
    Icons.settings,
  ];

  var pages = [
    HomeView(),
    FavoriteView(),
    DownloadView(),
    SettingsView(),
  ];

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}
