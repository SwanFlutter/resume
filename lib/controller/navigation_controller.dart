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
import 'package:resume/screen/resume/resume_info/resume_edite.dart';
import 'package:resume/screen/resume/resumeh_info.dart';
import 'package:resume/screen/resume/skils.dart';
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

  void navigateToDashboard() {
    changePage(1);
  }

  void navigateToResume() {
    changePage(2);
  }

  void navigateToJobs() {
    changePage(3);
  }

  void navigateToCompany() {
    changePage(4);
  }

  void navigateToSettings() {
    changePage(5);
  }

  void navigateToHome() {
    changePage(0);
  }

  // Resume sub-page navigation methods
  void navigateToResumeInfo() {
    changePage(6);
  }

  void navigateToJobExperience() {
    changePage(7);
  }

  void navigateToAcademicHistory() {
    changePage(8);
  }

  void navigateToSkills() {
    changePage(9);
  }

  void navigateToAchievement() {
    changePage(10);
  }

  void navigateToCoursesPage() {
    changePage(11);
  }

  void navigateToResumeEdite() {
    changePage(12);
  }

  void navigateToTestProgress() {
    changePage(13);
  }
}
