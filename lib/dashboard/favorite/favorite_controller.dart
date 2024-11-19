import 'package:flutter/src/scheduler/ticker.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:nova_demo/dashboard/common/custom_item.dart';

class FavoriteController extends GetxController {
  var favoriteList = [
  ].obs;


  void addItem() {
    favoriteList.add(
        CustomItem(
          title: 'Spider Man  ${favoriteList.length+1}',
          subtitle: 'Chris Evans',
          leadingImage: 'spider_man',
          suffix: 'heart',
          price: '10',
        )
    );
    update();
  }

  void removeItem(int index) {
    favoriteList.removeAt(index);
    update();
  }

}
