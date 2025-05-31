import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/screen/resume/academic_history.dart';
import 'package:resume/screen/resume/achivement.dart';
import 'package:resume/screen/resume/courses/courses.dart';
import 'package:resume/screen/resume/job_experience.dart';
import 'package:resume/screen/resume/resume_info/resumeh_info.dart';
import 'package:resume/screen/resume/skils/skils.dart';

class HomeController extends GetXController {
  static HomeController get to => Get.smartFind<HomeController>();

  final List<String> icons = [
    "assets/reuomeh/personalcard.svg",
    "assets/reuomeh/favorite-chart.svg",
    "assets/reuomeh/user-octagon.svg",
    "assets/reuomeh/lamp-charge.svg",
    "assets/reuomeh/cup-star-svgrepo-com 1.svg",
    "assets/reuomeh/Academy.svg",
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
