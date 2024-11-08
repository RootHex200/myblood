import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectTimeController extends GetxController {
  var selectedTime = TimeOfDay.now().obs;

  selectTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
        context: Get.context!,
        initialTime: selectedTime.value,
        helpText: "সময় নির্বাচন করুন",
        initialEntryMode: TimePickerEntryMode.inputOnly);

    if (pickedTime != null) {
      selectedTime.value = pickedTime;
    }
  }
}
