import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MyInfoController extends GetxController {
  var dateController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var selectedGender = ''.obs;
  var dropDownItems = [
    'Male',
    'Female',
    'Other',
  ];
  var selectedDropDownItem = ''.obs;

  Future<void> onTapDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      initialDate: DateTime.now(),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      dateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
    }
  }

  void updateGender(String gender) {
    selectedGender.value = gender;
  }
}
