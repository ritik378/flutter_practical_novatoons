import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SignUpController extends GetxController {
  var dateController = TextEditingController();
  var genderController = TextEditingController();
  var isChecked = false.obs;

  // Form key for validation
  var signUpFormKey = GlobalKey<FormState>();

  // Observables
  var passwordVisible = false.obs;
  var selectedGender = ''.obs;

  void checkBoxTap() {
    isChecked.value = !isChecked.value;
  }

  // Change password visibility
  void changePasswordVisibility() {
    passwordVisible.value = !passwordVisible.value;
  }

  // Handle date picker logic
  Future<void> onTapDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      lastDate: DateTime.now(),
      firstDate: DateTime(1900), // Adjust the first date as needed
      initialDate: DateTime.now(),
    );
    if (pickedDate != null) {
      dateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
    }
  }

  // Update selected gender
  void updateGender(String gender) {
    selectedGender.value = gender;
    genderController.text = gender;
  }
}
