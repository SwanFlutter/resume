import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/screen/company_page.dart';
import 'package:resume/screen/dashboard_page.dart';
import 'package:resume/screen/home.dart';
import 'package:resume/screen/jobs_page.dart';
import 'package:resume/screen/resume/academic/academic_history.dart';
import 'package:resume/screen/resume/academic/academic_history_add.dart';
import 'package:resume/screen/resume/achivement/achivement.dart';
import 'package:resume/screen/resume/achivement/add_new_achivement.dart';
import 'package:resume/screen/resume/courses/courses.dart';
import 'package:resume/screen/resume/courses/create_courses.dart';
import 'package:resume/screen/resume/courses/edit_create_course.dart';
import 'package:resume/screen/resume/experience/add_job_experience.dart';
import 'package:resume/screen/resume/experience/job_experience.dart';
import 'package:resume/screen/resume/resume_info/resume_edite.dart';
import 'package:resume/screen/resume/resume_info/resumeh_info.dart';
import 'package:resume/screen/resume/skils/add_new_hard_skils_page.dart';
import 'package:resume/screen/resume/skils/skils.dart';
import 'package:resume/screen/resume/skils/soft_skils_page.dart';
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
    const Skills(), // 9
    const Achivement(), // 10
    // Cousrses
    const Courses(), // 11
    const ResumeEdite(), // 12
    const CreateCourses(), // 13
    const EditCreateCourse(), // 14
    // Skils
    SoftSkillsPage(), // 15
    AddNewHardSkillsPage(), // 16
    // job experience
    AddJobExperience(), // 17
    // achivement
    AddNewAchivement(), // 18
    // academic history
    AcademicHistoryAdd(), // 19
  ];

  Widget get currentPage => _pages[_currentIndex.value];

  final List<String> nav = [
    "assets/bottomNavbar/home.svg",
    "assets/bottomNavbar/logout.svg",
    "assets/bottomNavbar/buildings.svg",
    "assets/bottomNavbar/setting-2.svg",
    "assets/bottomNavbar/element-equal.svg",
    "assets/bottomNavbar/personalcard.svg",
    "assets/bottomNavbar/briefcase.svg",
    "assets/bottomNavbar/more.svg",
  ];

  void changePage(int index) {
    _currentIndex.value = index;
    update();
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

  void navToCreateCourses() {
    changePage(13);
  }

  void navToEditCreateCourses() {
    changePage(14);
  }

  // Skils

  void navToSoftSkillsPage() {
    changePage(15);
  }

  void navToAddNewHardSkillsPage() {
    changePage(16);
  }

  void navToAddJobExperience() {
    changePage(17);
  }

  void navToAddNewAchivement() {
    changePage(18);
  }

  void navToAcademicHistoryAdd() {
    changePage(19);
  }

  /* void navToTestProgress() {
    changePage(13);
  }*/
}
