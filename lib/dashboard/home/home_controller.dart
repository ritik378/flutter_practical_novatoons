import 'package:get/get.dart';
import 'package:nova_demo/common/language/language_string.dart';

class HomeController extends GetxController {
  var selectedItemIndex = 0.obs;
  var items = [
    LanguageString.comicBook.tr,
    LanguageString.art.tr,
    LanguageString.eBook.tr,
    LanguageString.nft.tr
  ].obs;

  void onTapItem(int index) {
    selectedItemIndex.value = index;
    update();
  }
}
