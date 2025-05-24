import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/screen/company_page.dart';
import 'package:resume/screen/dashboard_page.dart';
import 'package:resume/screen/home.dart';
import 'package:resume/screen/jobs_page.dart';
import 'package:resume/screen/resume_page.dart';
import 'package:resume/screen/settings_page.dart';

class NavigationController extends GetXController {
  static NavigationController get to => Get.smartFind<NavigationController>();

  final RxInt _currentIndex = 0.obs;
  int get currentIndex => _currentIndex.value;

  final List<Widget> _pages = [
    const Home(),
    const DashboardPage(),
    const ResumePage(),
    const JobsPage(),
    const CompanyPage(),
    const SettingsPage(),
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
}
