import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/controller/home_controller.dart';
import 'package:resume/controller/navigation_controller.dart';
import 'package:resume/widgets/home/card_widget.dart';

class GridCardWidget extends StatelessWidget {
  const GridCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = HomeController.to;
    final navigationController = NavigationController.to;

    // Define navigation functions for each resume section
    final List<VoidCallback> navigationFunctions = [
      () => navigationController.navToResumeInfo(), // Resume Info
      () => navigationController.navToJobExperience(), // Job Experience
      () => navigationController.navToAcademicHistory(), // Academic History
      () => navigationController.navToSkills(), // Skills
      () => navigationController.navToAchievement(), // Achievement
      () => navigationController.navToCoursesPage(), // Courses
    ];

    return SizedBox(
      width: context.width,
      height: context.height * 0.8,
      child: Column(
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: 6,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.9,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 16,
                mainAxisExtent: context.height * 0.14,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: navigationFunctions[index],
                  child: CardWidget(
                    icon: controller.icons[index],
                    text: controller.texts[index],
                    begin: index % 2 == 0
                        ? Alignment.topRight
                        : Alignment.topLeft,
                    end: index % 2 == 0
                        ? Alignment.bottomLeft
                        : Alignment.bottomRight,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ).paddingOnly(right: 16.0, left: 16.0);
  }
}
