import 'package:avatar_better_pro/avatar_better_pro.dart';
import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/config/constant.dart';
import 'package:resume/controller/navigation_controller.dart';
import 'package:resume/controller/resume_controller.dart';
import 'package:resume/widgets/global/appbar_widget.dart';
import 'package:resume/widgets/global/card_box.dart';
import 'package:resume/widgets/global/custom_dropdown_widget.dart';
import 'package:resume/widgets/global/custom_fields_widget.dart';
import 'package:resume/widgets/global/logo_widget.dart';
import 'package:resume/widgets/resume/courses/date_text_field_cours_widget.dart';

class ResumeEdite extends StatelessWidget {
  const ResumeEdite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Non-scrollable content
          const LogoWidget(),
          AppBarWidget(
            title: "Resume Edit",
            onPressed: () {
              final navigationController = NavigationController.to;
              if (navigationController.currentIndex >= 6 &&
                  navigationController.currentIndex <= 12) {
                navigationController.navToResumeInfo();
              } else {
                Get.back();
              }
            },
          ),

          // Scrollable content
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Avatar.profile(
                          text: "Sajjad",
                          radius: MediaQuery.of(context).size.height * 0.07,
                          randomColor: false,
                          randomGradient: true,
                          backgroundColorCamera: const Color.fromRGBO(
                            30,
                            51,
                            99,
                            1,
                          ),
                          icon: Icons.camera,
                          useMaterialColorForGradient: true,
                          iconColor: Colors.white,
                        ),
                      ],
                    ),
                    SizedBox(height: context.height * 0.01),
                    // box Personal Information
                    CardBox(
                      width: context.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Personal Information",
                            style: TextStyleHelper.title14W600RegularOpenSans,
                          ),
                          const SizedBox(height: 10),
                          GetBuilder<ResumeController>(
                            builder: (controller) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CustomDropdownWidget(
                                          width: context.width,
                                          controller: controller,
                                          label: "Gender *",
                                          dropdownId: 'Gender',
                                          title: controller.gender,
                                          titleList: controller.genderList,
                                          height: context.height * 0.045,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: CustomFieldsWidget(
                                          width: context.width,
                                          label: 'Military Status *',
                                          hint: 'Describe Text',
                                          controllerInstance: controller.text1,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CupertioDateField(
                                          hint: "Edit Date",
                                          label: 'Date of Birth *',
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: CustomFieldsWidget(
                                          width: context.width,
                                          label: 'Marital Status *',
                                          hint: 'Describe Text',
                                          controllerInstance: controller.text1,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  CustomFieldsWidget(
                                    label: "Descriptions",
                                    controllerInstance: controller.description,
                                    width: context.width,
                                    hint: "Write your description here...",
                                    height: context.height * 0.1,
                                    maxLines: 5,
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ).paddingAll(8.0),
                    ),
                    SizedBox(height: context.height * 0.01),

                    // box Contact Information
                    CardBox(
                      width: context.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Contact Information",
                            style: TextStyleHelper.title14W600RegularOpenSans,
                          ),
                          const SizedBox(height: 10),
                          GetBuilder<ResumeController>(
                            builder: (controller) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CustomFieldsWidget(
                                          width: context.width,
                                          label: 'First Name *',
                                          hint: 'Eva',
                                          controllerInstance: controller.text1,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: CustomFieldsWidget(
                                          width: context.width,
                                          label: 'Last Name *',
                                          hint: 'Robbins',
                                          controllerInstance: controller.text1,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CustomFieldsWidget(
                                          width: context.width,
                                          label: 'National Code *',
                                          hint: '32563212565',
                                          controllerInstance: controller.text1,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: CustomFieldsWidget(
                                          width: context.width,
                                          label: 'Nationality *',
                                          hint: 'Iranian',
                                          controllerInstance: controller.text1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ).paddingAll(8.0),
                    ),
                    SizedBox(height: context.height * 0.01),
                    // box Job Preferences
                    CardBox(
                      width: context.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Job Preferences",
                            style: TextStyleHelper.title14W600RegularOpenSans,
                          ),
                          const SizedBox(height: 10),
                          GetBuilder<ResumeController>(
                            builder: (controller) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CustomFieldsWidget(
                                          width: context.width,
                                          label: 'Working Category *',
                                          hint: 'Manager',
                                          controllerInstance: controller.text1,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: CustomFieldsWidget(
                                          width: context.width,
                                          label: 'Minimal Salary *',
                                          hint: '5000000',
                                          controllerInstance: controller.text1,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  CustomFieldsWidget(
                                    width: context.width,
                                    label: 'Orgianizatiolonal *',
                                    hint: 'Category',
                                    controllerInstance: controller.text1,
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ).paddingAll(8.0),
                    ),
                    // box addreses
                    CardBox(
                      width: context.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Addreses",
                            style: TextStyleHelper.title14W600RegularOpenSans,
                          ),
                          const SizedBox(height: 10),
                          GetBuilder<ResumeController>(
                            builder: (controller) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CustomFieldsWidget(
                                          width: context.width,
                                          label: 'Country *',
                                          hint: 'Iran',
                                          controllerInstance: controller.text1,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: CustomFieldsWidget(
                                          width: context.width,
                                          label: 'City *',
                                          hint: 'Qazvin',
                                          controllerInstance: controller.text1,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  CustomFieldsWidget(
                                    width: context.width,
                                    label: 'Addreses *',
                                    hint: 'Address',
                                    controllerInstance: controller.text1,
                                    height: context.height * 0.045,
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ).paddingAll(8.0),
                    ),
                    SizedBox(height: context.height * 0.2),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppThemeColors.editeFabColor,
        shape: const StadiumBorder(),
        child: Image.asset("assets/Vector.png", width: 24.0, height: 24.0),
      ),
    );
  }
}
