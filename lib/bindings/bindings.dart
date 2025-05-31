import 'package:get_x_master/get_x_master.dart';
import 'package:resume/controller/bottom_navigation_controller.dart';
import 'package:resume/controller/courses_controller.dart';
import 'package:resume/controller/home_controller.dart';
import 'package:resume/controller/navigation_controller.dart';
import 'package:resume/controller/resume_controller.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.smartLazyPut(() => HomeController());
    Get.smartLazyPut(() => NavigationController());
    Get.smartLazyPut(() => BottomNavigationController());
    Get.smartLazyPut(() => ResumeController());
    Get.lazyPut(() => CoursesController());
  }
}
