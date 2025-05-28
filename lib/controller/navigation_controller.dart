import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/screen/company_page.dart';
import 'package:resume/screen/dashboard_page.dart';
import 'package:resume/screen/home.dart';
import 'package:resume/screen/jobs_page.dart';
import 'package:resume/screen/resume/academic_history.dart';
import 'package:resume/screen/resume/achivement.dart';
import 'package:resume/screen/resume/courses.dart';
import 'package:resume/screen/resume/job_experience.dart';
import 'package:resume/screen/resume/resume/resume_edite.dart';
import 'package:resume/screen/resume/resume/resumeh_info.dart';
import 'package:resume/screen/resume/skils/skils.dart';
import 'package:resume/screen/resume_page.dart';
import 'package:resume/screen/settings_page.dart';

class NavigationController extends GetXController {
  static NavigationController get to => Get.smartFind<NavigationController>();

  final RxInt _currentIndex = 0.obs;
  int get currentIndex => _currentIndex.value;

  final List<Widget> _pages = [
    const Home(), // 0
    const DashboardPage(), // 1
    const ResumePage(), // 2
    const JobsPage(), // 3
    const CompanyPage(), // 4
    const SettingsPage(), // 5
    // Resume sub-pages
    const ResumehInfo(), // 6
    const JobExperience(), // 7
    const AcademicHistory(), // 8
    const Skils(), // 9
    const Achivement(), // 10
    const Courses(), // 11
    const ResumeEdite(), // 12
  ];

  Widget get currentPage => _pages[_currentIndex.value];

  void changePage(int index) {
    _currentIndex.value = index;
  }

  void navToDashboard() {
    changePage(1);
  }

  void navToResume() {
    changePage(2);
  }

  void navToJobs() {
    changePage(3);
  }

  void navToCompany() {
    changePage(4);
  }

  void navigateToSettings() {
    changePage(5);
  }

  void navToHome() {
    changePage(0);
  }

  // Resume sub-page navigation methods
  void navToResumeInfo() {
    changePage(6);
  }

  void navToJobExperience() {
    changePage(7);
  }

  void navToAcademicHistory() {
    changePage(8);
  }

  void navToSkills() {
    changePage(9);
  }

  void navToAchievement() {
    changePage(10);
  }

  void navToCoursesPage() {
    changePage(11);
  }

  void navToResumeEdite() {
    changePage(12);
  }

  void navToTestProgress() {
    changePage(13);
  }
}
