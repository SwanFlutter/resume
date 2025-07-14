import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:intl/intl.dart';

class ResumeController extends GetXController {
  static ResumeController get to => Get.smartFind<ResumeController>();

  late TextEditingController militaryStatus,
      maritalStatus,
      dateTime,
      description,
      firstname,
      lastname,
      nationalCode,
      nationality,
      workingCategory,
      minimalSalary,
      orgianizatiolonal,
      country,
      city,
      addreses;
  String gender = "Edit Gender";
  List<String> genderList = ["Male", "Female", "Other"];

  @override
  void onInit() {
    militaryStatus = TextEditingController();
    maritalStatus = TextEditingController();
    dateTime = TextEditingController();
    firstname = TextEditingController();
    description = TextEditingController();
    lastname = TextEditingController();
    nationalCode = TextEditingController();
    nationality = TextEditingController();
    workingCategory = TextEditingController();
    minimalSalary = TextEditingController();
    orgianizatiolonal = TextEditingController();
    country = TextEditingController();
    city = TextEditingController();
    addreses = TextEditingController();
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
