import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/config/constant.dart';
import 'package:resume/controller/courses_controller.dart';
import 'package:resume/screen/resume_page.dart';
import 'package:resume/widgets/global/appbar_widget.dart';
import 'package:resume/widgets/global/card_box.dart';
import 'package:resume/widgets/global/custom_dropdown_widget.dart';
import 'package:resume/widgets/global/custom_fields_widget.dart';
import 'package:resume/widgets/global/logo_widget.dart';
import 'package:resume/widgets/resume/courses/date_text_field_cours_widget.dart';
import 'package:resume/widgets/resume/courses/file_widget.dart';
import 'package:resume/widgets/resume/courses/type_dropdown_widget.dart';

import '../../../config/extentions/extension_on_flutter.dart';

class CreateCourses extends StatelessWidget {
  const CreateCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            LogoWidget(),
            AppBarWidget(
              title: "Add New Courses",
              imageIcon: "assets/reuomeh/Academy.svg",
              onPressed: () {
                if (navigationController.currentIndex >= 6 &&
                    navigationController.currentIndex <= 13) {
                  navigationController
                      .navToCoursesPage(); // برگشت به Resume Page
                } else {
                  Get.back();
                }
              },
            ),
            CardBox(
              width: context.width,
              height: ResponsiveHelpers.h(pixels: 215),
              child: GetBuilder<CoursesController>(
                init: CoursesController(),
                builder: (controller) => Wrap(
                  runSpacing: 5,
                  spacing: 3,
                  children: [
                    CustomFieldsWidget(
                      label: "Type *",
                      controllerInstance: TextEditingController(),
                      hint: "Designer",
                      width: context.width * 0.40,
                    ),
                    CustomDropdownWidget(
                      controller: controller,
                      label: "State *",
                      width: context.width * 0.40,
                    ),
                    CustomFieldsWidget(
                      width: context.width,
                      label: "School *",
                      controllerInstance: TextEditingController(),
                      hint: "School",
                    ),
                    CupertioDateField(label: "Date *"),
                    TypeDropdownWidget(
                      controller: controller,
                      label: "Type *",
                      width: context.width * 0.40,
                    ),
                    SizedBox(height: 12.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 5),
                        SizedBox(
                          width: 14,
                          height: 14,
                          child: Checkbox.adaptive(
                            checkColor: AppThemeColors.colorFF9999,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            side: WidgetStateBorderSide.resolveWith(
                              (states) =>
                                  BorderSide(width: 1.0, color: Colors.grey),
                            ),
                            value: false,
                            onChanged: (value) {},
                          ),
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          "I am currently In This Course",
                          style: TextStyleHelper.title14W400RegularOpenSans,
                        ),
                      ],
                    ).padOnly(top: 8.0),
                  ],
                ).paddingSymmetric(horizontal: 8, vertical: 8),
              ).paddingOnly(left: 8, right: 8),
            ).paddingSymmetric(horizontal: 16.0),
            SizedBox(height: 11.0),
            CardBox(
              height: ResponsiveHelpers.h(pixels: 266),
              width: context.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FileWidget(
                    controllerInstance: TextEditingController(),
                  ).paddingSymmetric(horizontal: 8.0),
                  SizedBox(height: 12.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 5),
                      Text(
                        "Upload portfolio *",
                        style: TextStyleHelper.title10W700RegularOpenSans,
                      ),
                      Spacer(),
                      SizedBox(
                        width: 14,
                        height: 14,
                        child: Checkbox.adaptive(
                          checkColor: AppThemeColors.colorFF9999,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          side: WidgetStateBorderSide.resolveWith(
                            (states) =>
                                BorderSide(width: 1.0, color: Colors.grey),
                          ),
                          value: false,
                          onChanged: (value) {},
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        "By Degree",
                        style: TextStyleHelper.title10W700RegularOpenSans,
                      ).paddingOnly(right: 8.0),
                      SizedBox(
                        width: 14,
                        height: 14,
                        child: Checkbox.adaptive(
                          checkColor: AppThemeColors.colorFF9999,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          side: WidgetStateBorderSide.resolveWith(
                            (states) =>
                                BorderSide(width: 1.0, color: Colors.grey),
                          ),
                          value: false,
                          onChanged: (value) {},
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        "By Degree",
                        style: TextStyle(
                          color: AppThemeColors.titleFieldTextcolor,
                          fontWeight: FontWeight.w400,
                          fontSize: 10.0,
                        ),
                      ).paddingOnly(right: 8.0),
                    ],
                  ),
                  FileWidget(
                    controllerInstance: TextEditingController(),
                    titel: "",
                  ).paddingSymmetric(horizontal: 8.0),
                  SizedBox(height: 8.0),
                  CustomFieldsWidget(
                    controllerInstance: TextEditingController(),
                    label: 'Description *',
                    width: context.width,
                    maxLines: 6,
                    height: 64.0,
                  ).padSymmetric(horizontal: 8.0),
                ],
              ).paddingSymmetric(vertical: 16.0),
            ).paddingSymmetric(horizontal: 16.0),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: "Add New Course",
        shape: StadiumBorder(),
        backgroundColor: AppThemeColors.editeFabColor,
        child: Image.asset("assets/Vector.png", width: 24, height: 24),
      ),
    );
  }
}
