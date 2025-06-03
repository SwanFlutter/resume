import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/config/constant.dart';
import 'package:resume/screen/resume_page.dart';
import 'package:resume/widgets/global/appbar_widget.dart';
import 'package:resume/widgets/global/card_box.dart';
import 'package:resume/widgets/global/custom_fields_widget.dart';
import 'package:resume/widgets/global/logo_widget.dart';
import 'package:resume/widgets/resume/courses/file_widget.dart';

class AddNewAchivement extends StatelessWidget {
  const AddNewAchivement({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              child: Column(
                children: [
                  LogoWidget(),
                  AppBarWidget(
                    title: 'Achievements and accolades',
                    imageIcon: 'assets/reuomeh/cup-star-svgrepo-com 1.svg',
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
                  SizedBox(height: 21.0),
                  CardBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomFieldsWidget(
                          width: context.width,
                          label: "Type *",
                          hint: "Content",
                          controllerInstance: TextEditingController(),
                        ),
                        SizedBox(height: 8.0),
                        CustomFieldsWidget(
                          width: context.width,
                          label: "Date *",
                          hint: "Content",
                          controllerInstance: TextEditingController(),
                        ),
                        SizedBox(height: 8.0),
                        FileWidget(controllerInstance: TextEditingController()),
                        SizedBox(height: 8.0),
                        Row(
                          children: [
                            Expanded(
                              child: CustomFieldsWidget(
                                width: context.width / 2 - 24,
                                label: "Country",
                                hint: "Content",
                                controllerInstance: TextEditingController(),
                              ),
                            ),
                            SizedBox(width: 8.0),
                            Expanded(
                              child: CustomFieldsWidget(
                                width: context.width / 2 - 24,
                                label: "City",
                                hint: "Content",
                                controllerInstance: TextEditingController(),
                              ),
                            ),
                          ],
                        ),
                        CustomFieldsWidget(
                          controllerInstance: TextEditingController(),
                          label: 'Description *',
                          hint: 'Describe Text',
                          width: context.width,
                          maxLines: 2,
                          height: 64.0,
                        ),
                      ],
                    ).paddingAll(8.0),
                  ).marginOnly(left: 16.0, right: 16.0, bottom: 8.0),
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
              backgroundColor: AppThemeColors.editeFabColor,
              shape: StadiumBorder(),
              onPressed: () {
                navigationController.navToAchievement();
              },
              child: Image.asset("assets/Vector.png", width: 24, height: 24),
            ),
          ),
        ],
      ),
    );
  }
}
