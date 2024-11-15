import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  var passwordVisible = false.obs;
  var formKey = GlobalKey<FormState>();

  void changePasswordVisibility() {
    passwordVisible.value = !passwordVisible.value;
  }


}
