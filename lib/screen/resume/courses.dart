import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/config/constant.dart';
import 'package:resume/screen/resume/courses/create_courses.dart';
import 'package:resume/widgets/courses/card_courses_widget.dart';
import 'package:resume/widgets/global/appbar_widget.dart';
import 'package:resume/widgets/global/logo_widget.dart';

class Courses extends StatelessWidget {
  const Courses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: SingleChildScrollView(
          child: Column(
            children: [
              LogoWidget(),
              AppbarWidget(title: "Courses", icon: Icons.menu_book),
              SizedBox(
                height: context.height, // Adjust height as needed
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
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: addFabColor,
        shape: StadiumBorder(),
        onPressed: () => Get.to(() => CreateCourses()),
        child: Image.asset("assets/isIconOnly.png", width: 24, height: 24),
      ),
    );
  }
}
