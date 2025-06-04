import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:intl/intl.dart';

class ResumeController extends GetXController {
  static ResumeController get to => Get.smartFind<ResumeController>();

  late TextEditingController text1, textSecndery, dateTime, text3, description;
  String gender = "Edit Gender";
  List<String> genderList = ["Male", "Female", "Other"];

  @override
  void onInit() {
    text1 = TextEditingController();
    textSecndery = TextEditingController();
    dateTime = TextEditingController();
    text3 = TextEditingController();
    description = TextEditingController();
    super.onInit();
  }

  Future<DateTime> pickerTime(BuildContext context) async {
    DateTime? picker = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1985),
      lastDate: DateTime.now(),
    );

    if (picker != null) {
      String formatdate = DateFormat("yyyy-MM-dd").format(picker);
      dateTime.text = formatdate;
      update();
    }

    return picker ?? DateTime.now();
  }
}
