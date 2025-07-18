import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/config/constant.dart';
import 'package:resume/controller/bottom_navigation_controller.dart';
import 'package:resume/controller/courses_controller.dart';
import 'package:resume/model/coures_model.dart';
import 'package:resume/screen/resume_page.dart';
import 'package:resume/widgets/global/appbar_widget.dart';
import 'package:resume/widgets/global/background_colors_widget.dart';
import 'package:resume/widgets/global/logo_widget.dart';
import 'package:resume/widgets/resume/courses/card_courses_widget.dart';

class Courses extends StatelessWidget {
  const Courses({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomNavController = BottomNavigationController.to;
    return SafeArea(
      child: Stack(
        children: [
          BackgroundColorsWidget(
            child: SizedBox(
              width: context.width,
              height: context.height,
              child: Column(
                children: [
                  LogoWidget(),
                  AppBarWidget(
                    title: "Courses",
                    imageIcon: "assets/reuomeh/Academy.svg",
                    onPressed: () {
                      if (navigationController.currentIndex >= 6 &&
                          navigationController.currentIndex <= 12) {
                        navigationController
                            .navToResume(); // برگشت به Resume Page
                      } else {
                        Get.back();
                      }
                    },
                  ),
                  Expanded(
                    child: FutureBuilder<List<CouresModel>>(
                      future: CoursesController.to.fetchCourses(),
                      builder: (context, asyncSnapshot) {
                        if (asyncSnapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (asyncSnapshot.hasError) {
                          return Center(
                            child: Text('Error: ${asyncSnapshot.error}'),
                          );
                        } else if (asyncSnapshot.hasData) {
                          final courses = asyncSnapshot.data;
                          if (courses == null || courses.isEmpty) {
                            return Center(child: Text('No courses available'));
                          }

                          return ListView.builder(
                            padding: const EdgeInsets.only(bottom: 100),
                            itemCount: courses.length,
                            itemBuilder: (context, index) {
                              final course = courses[index];
                              return CardCoursesWidget(
                                title: course.type ?? 'Unknown Course',
                                subtitle:
                                    course.courseLevelField ??
                                    'Unknown Level', // استفاده از courseLevelField
                                isOnline: course.checkBox1 == 1 ? true : false,
                                stateSchool:
                                    course.nameIntl ??
                                    'Unknown Institution', // استفاده از nameIntl
                                timeSchool:
                                    course.duration ?? 'Unknown Duration',
                                school: course.description ?? 'Nahira.ir',
                              ).marginOnly(
                                bottom: context.height * 0.013,
                                left: 16.0,
                                right: 16.0,
                              );
                            },
                          );
                        } else {
                          return Center(child: Text('No courses available'));
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Obx(
            () => AnimatedPositioned(
              duration: const Duration(milliseconds: 1300),
              curve: Curves.easeInOutCubic,
              bottom: bottomNavController.isExpanded
                  ? bottomNavController.fabBottomPosition(context)
                  : bottomNavController.bottomNavBarTop.value,
              right: context.height * 0.022,
              child: FloatingActionButton(
                elevation: 0,
                backgroundColor: AppThemeColors.addFabColor,
                shape: StadiumBorder(),
                onPressed: () {
                  navigationController.navToCreateCourses();
                },
                child: Image.asset(
                  "assets/isIconOnly.png",
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
