import 'package:get/get.dart';

class HomeController extends GetxController {

  var selectedItemIndex = 0.obs;
   var items = [
    'Comic Books',
    'Art' ,
    'E- Book',
    'Nft'
   ].obs;

   void onTapItem(int index){
     selectedItemIndex.value = index;
      update();
   }

}