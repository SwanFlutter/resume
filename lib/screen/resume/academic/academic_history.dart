import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/config/constant.dart';
import 'package:resume/screen/resume_page.dart';
import 'package:resume/widgets/global/appbar_widget.dart';
import 'package:resume/widgets/global/logo_widget.dart';
import 'package:resume/widgets/resume/acadmic/card_acadmic_widget.dart';

class AcademicHistory extends StatelessWidget {
  const AcademicHistory({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          SizedBox(
            width: context.width,
            height: context.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LogoWidget(),
                AppBarWidget(
                  title: "Academic History",
                  imageIcon: "assets/reuomeh/personalcard.svg",
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
                      return CardAcadmicWidget(
                        title: "Software Developer",
                        subtitle: "Bachelor",
                        isOnline: true,
                        width: context.width,
                        height: context.height * 0.1115,
                        degree: "Bachelor",
                        dateRange: "Bachelor",
                        university: "Tehran University",
                      ).paddingOnly(bottom: 10.0);
                    },
                  ).paddingSymmetric(horizontal: 16.0),
                ),
              ],
            ),
          ),
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
                  navigationController.navToAcademicHistoryAdd();
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
