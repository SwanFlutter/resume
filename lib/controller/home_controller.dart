import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/screen/resume/academic_history.dart';
import 'package:resume/screen/resume/achivement.dart';
import 'package:resume/screen/resume/courses.dart';
import 'package:resume/screen/resume/job_experience.dart';
import 'package:resume/screen/resume/resume/resumeh_info.dart';
import 'package:resume/screen/resume/skils/skils.dart';

class HomeController extends GetXController {
  static HomeController get to => Get.smartFind<HomeController>();

  final List<IconData> icons = [
    Icons.badge_outlined,
    Icons.work_outline_sharp,
    Icons.school_outlined,
    Icons.lightbulb_outline,
    Icons.emoji_events_outlined,
    Icons.menu_book,
  ];

  final List<String> texts = [
    "Resume Info",
    "Job Experience",
    "Academic History",
    "Skills",
    "Achivement",
    "Courses",
  ];

  final List<Widget> route = [
    ResumehInfo(),
    JobExperience(),
    AcademicHistory(),
    Skils(),
    Achivement(),
    Courses(),
  ];

  RxBool isExpanded = false.obs;
  double height = 63.0;

  void toggleExpand() {
    isExpanded.value = !isExpanded.value;
    height = isExpanded.value ? 120.0 : 63.0;
  }
}
