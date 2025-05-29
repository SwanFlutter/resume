import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/config/constant.dart';
import 'package:resume/screen/resume/courses/create_courses.dart';
import 'package:resume/widgets/global/appbar_widget.dart';
import 'package:resume/widgets/global/logo_widget.dart';
import 'package:resume/widgets/resume/courses/card_courses_widget.dart';

class Courses extends StatelessWidget {
  const Courses({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: context.height,
      child: Column(
        children: [
          LogoWidget(),
          AppBarWidget(title: "Courses", icon: Icons.menu_book),
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Replace with actual item count
              itemBuilder: (context, index) {
                return CardCoursesWidget(
                  title: "Flutter Development",
                  subtitle: "Online Course",
                  isOnline: true,
                  stateSchool: "Online Course",
                  timeSchool: "Feb 2024",
                  school: "Nahira.ir",
                );
              },
            ),
          ),
          // Add floating action button as a regular widget
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                backgroundColor: AppThemeColors.addFabColor,
                shape: StadiumBorder(),
                onPressed: () => Get.to(() => CreateCourses()),
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
