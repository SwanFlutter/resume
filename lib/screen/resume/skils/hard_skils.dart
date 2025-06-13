import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/config/constant.dart';
import 'package:resume/controller/bottom_navigation_controller.dart';
import 'package:resume/screen/resume_page.dart';
import 'package:resume/widgets/custom/custom_progress_indicator.dart';
import 'package:resume/widgets/global/appbar_widget.dart';
import 'package:resume/widgets/global/card_box.dart';
import 'package:resume/widgets/global/logo_widget.dart';

class HardSkils extends StatelessWidget {
  HardSkils({super.key});

  final List<Map<String, dynamic>> skills = [
    {
      'name': 'Adobe Photoshop',
      'level': 'B',
      'grad': '30%',
      'date': '2023',
      'progress': 80,
      'color': Color.fromRGBO(34, 173, 92, 1),
    },
    {
      'name': 'Google Workspace',
      'level': 'C',
      'grad': '30%',
      'date': '2023',
      'progress': 20,
      'color': Colors.red,
    },
    {
      'name': 'Figma',
      'level': 'B',
      'grad': '30%',
      'date': '2023',
      'progress': 80,
      'color': Colors.green,
    },
    {
      'name': 'Google Workspace',
      'level': 'C',
      'grad': '30%',
      'date': '2023',
      'progress': 20,
      'color': Colors.red,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final bottomNavController = BottomNavigationController.to;

    return SafeArea(
      child: Stack(
        children: [
          SizedBox(
            width: context.width,
            height: context.height,
            child: Column(
              children: [
                LogoWidget(),
                AppBarWidget(
                  title: "Hard Skills",
                  imageIcon: 'assets/star.png',
                  isSearch: true,
                  onPressed: () {
                    if (navigationController.currentIndex >= 6 &&
                        navigationController.currentIndex <= 21) {
                      navigationController.navToSkills();
                    } else {
                      Get.back();
                    }
                  },
                ),
                const SizedBox(height: 21),
                Expanded(
                  child: ListView.builder(
                    itemCount: skills.length,
                    padding: const EdgeInsets.only(bottom: 100),
                    itemBuilder: (context, index) {
                      final skill = skills[index];
                      return CardBox(
                        height: context.height * 0.12,
                        boxShadow: context.theme.brightness == Brightness.dark
                            ? [resumeBoxShadowDark]
                            : [resumeBoxShadow],
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: context.height * 0.015,
                            horizontal: 8.0,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          "assets/ps.png",
                                          width: context.height * 0.02,
                                          height: context.height * 0.02,
                                        ),
                                        SizedBox(width: context.width * 0.01),
                                        Text(
                                          skill['name'],
                                          style:
                                              context.theme.brightness ==
                                                  Brightness.dark
                                              ? TextStyleHelper
                                                    .body12W400RegularOpenSansDark
                                              : TextStyleHelper
                                                    .body12W400RegularOpenSans,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: context.height * 0.04),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        _buildInfoItem(
                                          'Level:',
                                          skill['level'],
                                          context,
                                        ),
                                        SizedBox(width: context.width * 0.04),
                                        _buildInfoItem(
                                          'Grad:',
                                          skill['grad'],
                                          context,
                                        ),
                                        SizedBox(width: context.width * 0.04),
                                        _buildInfoItem(
                                          'Date:',
                                          skill['date'],
                                          context,
                                        ),
                                      ],
                                    ),
                                  ],
                                ).paddingOnly(left: 8.0),
                              ),
                              SizedBox(width: context.width * 0.02),
                              Expanded(
                                flex: 1,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    CustomProgressIndicator(
                                      progress: skill['progress'],
                                      gradientColors: [
                                        skill['color'],
                                        skill['color'].withOpacity(0.7),
                                        skill['color'].withOpacity(0.5),
                                      ],
                                      size: context.height * 0.08,
                                      showDoubleProgress: true,
                                      secondaryProgress: skill['progress'],
                                      strokeWidth: 4,
                                      textStyle: TextStyle(
                                        fontSize: context.height * 0.015,
                                        fontWeight: FontWeight.w600,
                                        color: skill['color'],
                                      ),
                                    ).paddingOnly(left: context.width * 0.06),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ).marginOnly(
                        bottom: context.height * 0.01,
                        right: context.width * 0.04,
                        left: context.width * 0.04,
                      );
                    },
                  ),
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
                backgroundColor: AppThemeColors.editeFabColor,
                shape: const StadiumBorder(),
                onPressed: () {
                  navigationController.navToAddNewHardSkillsPage();
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

  Widget _buildInfoItem(String label, String value, BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: Theme.of(context).brightness == Brightness.dark
              ? TextStyleHelper.label10W400RegularOpenSansDark.copyWith(
                  color: AppThemeColors.gray,
                )
              : TextStyleHelper.label10W400RegularOpenSans.copyWith(
                  color: AppThemeColors.gray,
                ),
        ),
        const SizedBox(width: 4),
        Text(
          value,
          style: Theme.of(context).brightness == Brightness.dark
              ? TextStyleHelper.label10W600SemiBoldOpenSansDark
              : TextStyleHelper.label10W600SemiBoldOpenSans,
        ),
      ],
    );
  }
}
