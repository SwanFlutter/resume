import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/controller/home_controller.dart';
import 'package:resume/controller/navigation_controller.dart';
import 'package:resume/widgets/resume/resume/card_widget.dart';

class GridCardWidget extends StatelessWidget {
  const GridCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = HomeController.to;
    final navigationController = NavigationController.to;

    // Define navigation functions for each resume section
    final List<VoidCallback> navigationFunctions = [
      () {
        controller.setLastClickedIndex(0);
        navigationController.navToResumeInfo();
      }, // Resume Info
      () {
        controller.setLastClickedIndex(1);
        navigationController.navToJobExperience();
      }, // Job Experience
      () {
        controller.setLastClickedIndex(2);
        navigationController.navToAcademicHistory();
      }, // Academic History
      () {
        controller.setLastClickedIndex(3);
        navigationController.navToSkills();
      }, // Skills
      () {
        controller.setLastClickedIndex(4);
        navigationController.navToAchievement();
      }, // Achievement
      () {
        controller.setLastClickedIndex(5);
        navigationController.navToCoursesPage();
      }, // Courses
    ];

    return Expanded(
      child: SizedBox(
        width: context.width,
        height: context.height,
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
                  mainAxisExtent: context.height * 0.12,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: navigationFunctions[index],
                    child: Obx(
                      () => CardWidget(
                        isSelected: controller.lastClickedIndex.value == index,
                        icon: controller.icons[index],
                        text: controller.texts[index],
                        begin: index % 2 == 0
                            ? Alignment.topRight
                            : Alignment.topLeft,
                        end: index % 2 == 0
                            ? Alignment.bottomLeft
                            : Alignment.bottomRight,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ).paddingOnly(right: 16.0, left: 16.0, top: 16.0),
    );
  }
}
