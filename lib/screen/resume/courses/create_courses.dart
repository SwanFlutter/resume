import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/config/constant.dart';
import 'package:resume/controller/courses_controller.dart';
import 'package:resume/widgets/courses/date_text_field_cours_widget.dart';
import 'package:resume/widgets/courses/state_dropdown_widget.dart';
import 'package:resume/widgets/courses/type_dropdown_widget.dart';
import 'package:resume/widgets/global/appbar_widget.dart';
import 'package:resume/widgets/global/logo_widget.dart';
import 'package:resume/widgets/resume/resume_fields.dart';

class CreateCourses extends StatelessWidget {
  const CreateCourses({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          LogoWidget(),
          AppbarWidget(title: "Add New Courses", icon: Icons.menu_book),
          Container(
            width: 288,
            height: 215,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: context.theme.colorScheme.onPrimary,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 2),
                  blurRadius: 3,
                  spreadRadius: 1,
                  blurStyle: BlurStyle.outer,
                  color: Colors.grey.withValues(alpha: 0.5),
                ),
              ],
            ),
            child: GetBuilder<CoursesController>(
              init: CoursesController(),
              builder: (controller) => Wrap(
                runSpacing: 5,
                spacing: 3,
                children: [
                  RegularTextFieldWidget(
                    label: "Type *",
                    controllerInstance: TextEditingController(),
                    hint: "Designer",
                  ),
                  StateFeildWidget(controller: controller, label: "State *"),
                  RegularTextFieldWidget(
                    width: context.width,
                    label: "School *",
                    controllerInstance: TextEditingController(),
                    hint: "School",
                  ),
                  DateTextFielCoursdWidget(
                    controller: controller,
                    label: "Date *",
                  ),
                  TypeDropdownWidget(controller: controller, label: "Type *"),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 5),
                      SizedBox(
                        width: 14,
                        height: 14,
                        child: Checkbox.adaptive(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          value: false,
                          onChanged: (value) {},
                        ),
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        "I am currently In This Course",
                        style: TextStyle(
                          color: titleFieldTextcolor,
                          fontWeight: FontWeight.w400,
                          fontSize: 10.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ).paddingSymmetric(horizontal: 8, vertical: 8),
            ),
          ).paddingOnly(left: 8, right: 8),

          SizedBox(height: 16.0),
          // box two
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: context.theme.colorScheme.onPrimary,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 2),
                  blurRadius: 3,
                  spreadRadius: 1,
                  blurStyle: BlurStyle.outer,
                  color: Colors.grey.withValues(alpha: 0.5),
                ),
              ],
            ),
            height: 212,
            width: 288,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RegularTextFieldWidget(
                  width: context.width,
                  label: "Upload portfolio *",
                  controllerInstance: TextEditingController(),
                  hint: "Add Content",
                ),
                SizedBox(height: 12.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 5),
                    Text(
                      "Upload portfolio *",
                      style: TextStyle(
                        color: titleFieldTextcolor,
                        fontWeight: FontWeight.w800,
                        fontSize: 10.0,
                      ),
                    ),
                    Spacer(),
                    SizedBox(
                      width: 14,
                      height: 14,
                      child: Checkbox.adaptive(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        value: false,
                        onChanged: (value) {},
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      "By Degree",
                      style: TextStyle(
                        color: titleFieldTextcolor,
                        fontWeight: FontWeight.w400,
                        fontSize: 10.0,
                      ),
                    ).paddingOnly(right: 8.0),
                    SizedBox(
                      width: 14,
                      height: 14,

                      child: Checkbox.adaptive(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        value: false,
                        onChanged: (value) {},
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      "By Degree",
                      style: TextStyle(
                        color: titleFieldTextcolor,
                        fontWeight: FontWeight.w400,
                        fontSize: 10.0,
                      ),
                    ).paddingOnly(right: 8.0),
                  ],
                ),
              ],
            ).paddingSymmetric(horizontal: 8.0, vertical: 10.0),
          ).paddingOnly(left: 8.0, right: 8.0),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: "Add New Course",
        shape: StadiumBorder(),
        backgroundColor: editeFabColor,
        child: Image.asset("assets/Vector.png", width: 24, height: 24),
      ),
    );
  }
}
