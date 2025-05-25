import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:intl/intl.dart';

class CoursesController extends GetXController {
  static CoursesController get to => Get.smartFind<CoursesController>();

  late String typeCourse = "Course";
  late String title = "Ux Research";
  List<String> titleList = ["Ux Research", "Ux Design", "UI Design"];
  List<String> typeCourseList = ["Online Course", "Course", "Regular Course"];

  late TextEditingController dateTime = TextEditingController();

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
