import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/config/constant.dart';
import 'package:resume/screen/resume_page.dart';
import 'package:resume/widgets/global/appbar_widget.dart';
import 'package:resume/widgets/global/card_box.dart';
import 'package:resume/widgets/global/logo_widget.dart';

class Skills extends StatelessWidget {
  const Skills({super.key});

  // Sample data for the list items
  final List<Map<String, dynamic>> skillsData = const [
    {'icon': 'assets/star.svg', 'text': 'Soft Skills'},
    {'icon': 'assets/star.svg', 'text': 'Hard Skills'},
  ];

  @override
  Widget build(BuildContext context) {
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
                  title: "Skills",
                  imageIcon: "assets/lamp-charge.png",
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
                    itemCount: skillsData.length,
                    itemBuilder: (context, index) {
                      // Access data for the current index
                      var skill = skillsData[index];

                      return InkWell(
                        onTap: () {
                          if (index == 0) {
                            navigationController.navToSoftSkillsPage();
                          } else if (index == 1) {
                            navigationController.navToHardSkils();
                          }
                        },
                        child: CardBox(
                          height: context.height * 0.05,
                          boxShadow: context.theme.brightness == Brightness.dark
                              ? [resumeBoxShadowDark]
                              : [resumeBoxShadow],
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                skill['icon'], // Use the icon from the mapped data
                                width: 14.0,
                                height: 14.0,
                                colorFilter: ColorFilter.mode(
                                  context.theme.brightness == Brightness.dark
                                      ? Colors.white
                                      : AppThemeColors.titleFieldTextcolor,
                                  BlendMode.srcIn,
                                ),
                              ),
                              SizedBox(width: 4.0), // Use SizedBox for spacing
                              Text(
                                skill['text'], // Use the text from the mapped data
                                style:
                                    context.theme.brightness == Brightness.dark
                                    ? TextStyleHelper
                                          .body12W400RegularOpenSansDark
                                    : TextStyleHelper.body12W400RegularOpenSans,
                              ),
                            ],
                          ).paddingSymmetric(horizontal: 12.0, vertical: 8.0),
                        ).marginOnly(bottom: 8.0),
                      );
                    },
                  ).paddingSymmetric(horizontal: 16.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
