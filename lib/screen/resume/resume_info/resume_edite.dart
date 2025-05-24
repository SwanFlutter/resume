import 'package:avatar_better_pro/avatar_better_pro.dart';
import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/controller/resume_controller.dart';
import 'package:resume/widgets/global/appbar_widget.dart';
import 'package:resume/widgets/global/logo_widget.dart';
import 'package:resume/widgets/resume_fields.dart';

class ResumeEdite extends StatelessWidget {
  const ResumeEdite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            LogoWidget(),
            AppbarWidget(title: "Resume Edite"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Avatar.profile(
                  text: "Sajjad",
                  radius: 40,
                  randomColor: false,
                  randomGradient: true,
                  backgroundColorCamera: Color.fromRGBO(30, 51, 99, 1),
                  icon: Icons.camera,
                  useMaterialColorForGradient: true,
                  iconColor: Colors.white,
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Container(
              width: 288,
              height: 229,
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
              child: Column(
                children: [
                  Text(
                    "Personal Information",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ).paddingOnly(top: 10),
                  SizedBox(height: 5),
                  GetBuilder<ResumeController>(
                    builder: (controller) {
                      return Column(
                        children: [
                          Wrap(
                            spacing: 5,
                            runSpacing: 10,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Gender *',
                                    style: TextStyle(
                                      fontSize: 10.0,
                                      color: Color.fromRGBO(107, 114, 128, 1),
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  GenderFeildWidget(controller: controller),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 4),
                                  RegularTextFieldWidget(
                                    controller: controller,
                                    label: 'MilitaryStatusWidget *',
                                    controllerInstance: controller.text1,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 4),
                                  DateTextFieldWidget(controller: controller),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 4),
                                  RegularTextFieldWidget(
                                    controller: controller,
                                    label: 'Marital Status *',
                                    controllerInstance: controller.text3,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextFeildWidget extends StatelessWidget {
  final ResumeController controller;
  const TextFeildWidget({super.key, required this.controller});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 134,
      height: 32,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white, Color.fromRGBO(254, 222, 230, 1)],
        ),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: TextField(
        controller: controller.text1,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
        ),
      ),
    );
  }
}

class GenderFeildWidget extends StatelessWidget {
  final ResumeController controller;
  const GenderFeildWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 134,
      height: 32,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white, Color.fromRGBO(254, 222, 230, 1)],
        ),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: DropdownButton<String>(
        value: controller.gender.value.isEmpty ? null : controller.gender.value,
        isExpanded: true,
        underline: SizedBox(),
        icon: Icon(Icons.keyboard_arrow_down, size: 16).paddingOnly(right: 10),
        iconSize: 16,
        style: TextStyle(
          fontSize: 10.0,
          color: Color.fromRGBO(107, 114, 128, 1),
        ),
        items: controller.genderList
            .map(
              (e) => DropdownMenuItem(
                value: e,
                child: Text(
                  e,
                  style: TextStyle(
                    fontSize: 10.0,
                    color: Color.fromRGBO(107, 114, 128, 1),
                  ),
                ).paddingOnly(left: 10.0),
              ),
            )
            .toList(),
        onChanged: (value) {
          if (value != null) {
            controller.gender = value;
            controller.update();
          }
        },
        hint: Text(
          'Edit Gender',
          style: TextStyle(
            fontSize: 10.0,
            color: Color.fromRGBO(107, 114, 128, 1),
          ),
        ).paddingOnly(left: 10.0),
      ),
    );
  }
}

class MeiddelB0xInfo extends StatelessWidget {
  final String title;
  final List<Widget> cardInfoViews;
  final String description;

  const MeiddelB0xInfo({
    super.key,
    required this.title,
    required this.cardInfoViews,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 288,
      height: 229,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
          ).paddingOnly(top: 10),
          SizedBox(height: 5),

          Wrap(spacing: 5, runSpacing: 5, children: []),
          Text(
            "Descriptions",
            style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w700),
          ).paddingOnly(top: 8.0),
          Container(
            width: 292,
            height: 96,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(251, 241, 239, 1),
                  Color.fromRGBO(252, 248, 248, 1),
                  Color.fromRGBO(249, 240, 240, 1),
                  Color.fromRGBO(252, 244, 243, 1),
                ],
              ),
            ),
            child: SelectableText(
              description,
              style: TextStyle(color: Color.fromRGBO(153, 153, 153, 1)),
            ),
          ),
        ],
      ).paddingOnly(left: 5.0, right: 5),
    );
  }
}
