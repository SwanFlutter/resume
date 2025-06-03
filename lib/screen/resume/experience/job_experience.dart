import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/config/constant.dart';
import 'package:resume/screen/resume_page.dart';
import 'package:resume/widgets/experience/card_experience_widget.dart';
import 'package:resume/widgets/global/appbar_widget.dart';
import 'package:resume/widgets/global/logo_widget.dart';

class JobExperience extends StatelessWidget {
  const JobExperience({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              width: context.width,
              height: context.height,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  LogoWidget(),
                  AppBarWidget(
                    title: "Job Experience",
                    imageIcon: "assets/reuomeh/favorite-chart.svg",
                    onPressed: () {
                      if (navigationController.currentIndex >= 6 &&
                          navigationController.currentIndex <= 12) {
                        navigationController
                            .navToResume(); // Return to Resume Page
                      } else {
                        Get.back(); // Return to the previous page
                      }
                    },
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 10, // Replace with actual item count
                      itemBuilder: (context, index) {
                        return CardExperienceWidget(
                              title: "Founder & Ceo",
                              subtitle: "2018_now",
                              isOnline: true,
                              typeState: "Full-Time",
                              country: "UAE - Dubai",
                              school: "Hooragency",
                              index: index,
                            )
                            .marginOnly(bottom: 8.0)
                            .paddingSymmetric(horizontal: 16.0);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 1200),
            curve: Curves.ease,
            bottom: 0.0,
            right: 16.0,
            child: FloatingActionButton(
              elevation: 0,
              backgroundColor: AppThemeColors.addFabColor,
              shape: StadiumBorder(),
              onPressed: () {
                navigationController.navToAddJobExperience();
              },
              child: Image.asset(
                "assets/isIconOnly.png",
                width: 24,
                height: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
