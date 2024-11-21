import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SignUpController extends GetxController {
  /// Controller for the date input field.
  final dateController = TextEditingController();

  final selectedGender = ''.obs;
  final isChecked = false.obs;
  final signUpFormKey = GlobalKey<FormState>();
  final passwordVisible = false.obs;

  void checkBoxTap() => isChecked.value = !isChecked.value;

  void changePasswordVisibility() =>
      passwordVisible.value = !passwordVisible.value;

  /// Handles the date picker dialog and updates the date input field.
  Future<void> onTapDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      lastDate: DateTime.now(),
      firstDate: DateTime(1900),
      initialDate: DateTime.now(),
    );
    if (pickedDate != null) {
      dateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
    }
  }

  /// Updates the selected gender.
  void updateGender(String gender) => selectedGender.value = gender;
}
