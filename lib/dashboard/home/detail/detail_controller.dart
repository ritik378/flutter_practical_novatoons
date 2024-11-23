import 'package:get/get.dart';

class DetailController extends GetxController{
var initialRating = 0.0.obs;

void setRating(double rating){
  initialRating.value = rating;

}
}