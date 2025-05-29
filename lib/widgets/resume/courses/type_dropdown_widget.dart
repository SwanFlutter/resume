import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/config/constant.dart';
import 'package:resume/controller/courses_controller.dart';

class TypeDropdownWidget extends StatelessWidget {
  final CoursesController controller;
  final String label;
  const TypeDropdownWidget({
    super.key,
    required this.controller,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 10.0,
            color: AppThemeColors.titleFieldTextcolor,
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(height: 4),
        Container(
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
            value: controller.typeCourse.value.isEmpty
                ? null
                : controller.typeCourse.value,
            isExpanded: true,
            underline: SizedBox(),
            icon: Icon(
              Icons.keyboard_arrow_down,
              size: 16,
            ).paddingOnly(right: 10),
            iconSize: 16,
            style: TextStyle(
              fontSize: 10.0,
              color: Color.fromRGBO(107, 114, 128, 1),
            ),
            items: controller.typeCourseList
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
                controller.typeCourse = value;
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
        ),
      ],
    );
  }
}
