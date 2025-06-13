import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/config/constant.dart';
import 'package:resume/controller/bottom_navigation_controller.dart';
import 'package:resume/screen/resume_page.dart';
import 'package:resume/widgets/global/appbar_widget.dart';
import 'package:resume/widgets/global/background_colors.dart';
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
          BackgroundColors(
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
                        // در غیر این صورت از Get.back استفاده کن
                        Get.back();
                      }
                    },
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.only(bottom: 100),
                      itemCount: 10, // Replace with actual item count
                      itemBuilder: (context, index) {
                        return CardCoursesWidget(
                          title: "Flutter Development",
                          subtitle: "Online Course",
                          isOnline: true,
                          stateSchool: "Online Course",
                          timeSchool: "Feb 2024",
                          school: "Nahira.ir",
                        ).marginOnly(bottom: 8.0, left: 16.0, right: 16.0);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Floating Action Button که با navigation bar جابجا می‌شود
          Obx(
            () => AnimatedPositioned(
              duration: const Duration(milliseconds: 1000),
              curve: Curves.easeInOutCubic,
              bottom: bottomNavController.isExpanded
                  ? bottomNavController.fabBottomPosition(context)
                  : context.width * 0.04,
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
