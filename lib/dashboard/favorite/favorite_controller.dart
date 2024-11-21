import 'package:get/get.dart';
import 'package:nova_demo/dashboard/common/custom_item.dart';

class FavoriteController extends GetxController {
  var favoriteList = <CustomItem>[].obs;

  /// Adds a new item to the favorite list.
  void addItem() {
    favoriteList.add(
      CustomItem(
        title: 'Spider Man ${favoriteList.length + 1}',
        subtitle: 'Chris Evans',
        leadingImage: 'spider_man',
        suffix: 'heart',
        price: '10',
      ),
    );
    update();
  }

  /// Removes an item from the favorite list at the specified index.
  void removeItem(int index) {
    favoriteList.removeAt(index);
    update();
  }
}
