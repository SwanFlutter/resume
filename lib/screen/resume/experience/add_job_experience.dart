import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/config/constant.dart';
import 'package:resume/controller/experience_controller.dart';
import 'package:resume/screen/resume_page.dart';
import 'package:resume/widgets/global/appbar_widget.dart';
import 'package:resume/widgets/global/card_box.dart';
import 'package:resume/widgets/global/custom_dropdown_widget.dart';
import 'package:resume/widgets/global/custom_fields_widget.dart';
import 'package:resume/widgets/global/logo_widget.dart';

class AddJobExperience extends StatelessWidget {
  const AddJobExperience({super.key});

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
                    title: "Add Job Exprience",
                    imageIcon: "assets/reuomeh/favorite-chart.svg",
                    onPressed: () {
                      if (navigationController.currentIndex >= 6 &&
                          navigationController.currentIndex <= 17) {
                        navigationController.navToJobExperience();
                      } else {
                        Get.back();
                      }
                    },
                  ),
                  CardBox(
                    width: context.width,

                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "general Information",
                              style: TextStyleHelper.title14W600RegularOpenSans,
                            ),
                          ],
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          children: [
                            Expanded(
                              child: CustomFieldsWidget(
                                width: context.width,
                                label: 'Job Title *',
                                hint: 'Designer',
                                controllerInstance: TextEditingController(),
                              ),
                            ),
                            SizedBox(width: 8.0),
                            Expanded(
                              child: CustomFieldsWidget(
                                width: context.width,
                                label: 'Company Name *',
                                hint: 'Apple',
                                controllerInstance: TextEditingController(),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.0),
                        GetBuilder<ExperienceController>(
                          builder: (controller) {
                            return CustomDropdownWidget(
                              controller: Get.find<ExperienceController>(),
                              width: context.width,
                              label: 'Job Type',
                              dropdownId: 'JobType',
                              title: controller.title,
                              titleList: controller.jobTypeList,
                            );
                          },
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          children: [
                            Expanded(
                              child: CustomFieldsWidget(
                                width: context.width,
                                label: 'Start Date *',
                                hint: 'YYYY/MM/DD',
                                controllerInstance: TextEditingController(),
                                prefixIcon: true,
                              ),
                            ),
                            SizedBox(width: 8.0),
                            Expanded(
                              child: CustomFieldsWidget(
                                width: context.width,
                                label: 'Quit Date *',
                                hint: 'YYYY/MM/DD',
                                controllerInstance: TextEditingController(),
                                prefixIcon: true,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.0),
                        Row(
                          children: [
                            SizedBox(
                              width: 10,
                              height: 10,
                              child: Checkbox.adaptive(
                                checkColor: AppThemeColors.colorFF9999,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                side: WidgetStateBorderSide.resolveWith(
                                  (states) => BorderSide(
                                    width: 1.0,
                                    color: Colors.grey,
                                  ),
                                ),
                                value: false,
                                onChanged: (value) {},
                              ),
                            ),
                            SizedBox(width: 8.0),
                            Flexible(
                              child: Text(
                                "I am currently In This Course",
                                style: TextStyleHelper
                                    .title14W400RegularOpenSans
                                    .copyWith(fontSize: 10),
                              ),
                            ),
                          ],
                        ).paddingOnly(left: 5.0),
                      ],
                    ).paddingSymmetric(horizontal: 8.0, vertical: 12.0),
                  ).marginOnly(top: 21.0, left: 16.0, right: 16.0, bottom: 8.0),
                  SizedBox(height: 8.0),
                  CardBox(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Detail Information",
                              style: TextStyleHelper.title14W600RegularOpenSans,
                            ),
                          ],
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          children: [
                            Expanded(
                              child: CustomFieldsWidget(
                                width: context.width,
                                label: 'Upload Portfolio *',
                                hint: 'Describe Text',
                                controllerInstance: TextEditingController(),
                              ),
                            ),
                            SizedBox(width: 8.0),
                            Expanded(
                              child: CustomFieldsWidget(
                                width: context.width,
                                label: 'City *',
                                hint: 'Describe Text',
                                controllerInstance: TextEditingController(),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          children: [
                            Expanded(
                              child: CustomFieldsWidget(
                                width: context.width,
                                label: 'Salary Receive *',
                                hint: 'Describe Text',
                                controllerInstance: TextEditingController(),
                              ),
                            ),
                            SizedBox(width: 8.0),
                            Expanded(
                              child: GetBuilder(
                                builder: (ExperienceController controller) {
                                  return CustomDropdownWidget(
                                    controller: controller,
                                    width: context.width,
                                    label: 'Salary Type',
                                    dropdownId: 'SalaryType',
                                    title: controller.chooseType,
                                    titleList: controller.chooseList,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          children: [
                            Expanded(
                              child: CustomFieldsWidget(
                                width: context.width,
                                label: 'Address *',
                                hint: 'Describe Text',
                                controllerInstance: TextEditingController(),
                              ),
                            ),
                            SizedBox(width: 8.0),
                            Expanded(
                              child: CustomFieldsWidget(
                                width: context.width,
                                label: 'Occupational group *',
                                hint: 'Describe Text',
                                controllerInstance: TextEditingController(),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.0),
                        CustomFieldsWidget(
                          width: context.width,
                          label: 'Description and Achievements *',
                          hint: 'Not Perfer To Say',
                          controllerInstance: TextEditingController(),
                        ),
                        SizedBox(height: 8.0),
                        CustomFieldsWidget(
                          controllerInstance: TextEditingController(),
                          label: 'Description *',
                          hint: 'Describe Text',
                          width: context.width,
                          maxLines: 2,
                          height: 64.0,
                        ),
                      ],
                    ).paddingSymmetric(horizontal: 8.0, vertical: 12.0),
                  ).marginOnly(left: 16.0, right: 16.0, bottom: 8),
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
                navigationController.navToJobExperience();
              },
              child: Image.asset("assets/Vector.png", width: 24, height: 24),
            ),
          ),
        ],
      ),
    );
  }
}
