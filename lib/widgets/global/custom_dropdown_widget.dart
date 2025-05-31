import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/config/constant.dart';
import 'package:resume/controller/courses_controller.dart';

class CustomDropdownWidget extends StatelessWidget {
  final CoursesController controller;
  final String label;
  final double width;
  final double height;
  const CustomDropdownWidget({
    super.key,
    required this.controller,
    required this.label,
    this.width = 134,
    this.height = 32,
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
          width: width,
          height: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: backgroudColorFeild,
            ),
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: DropdownButton<String>(
            value: controller.title.value.isEmpty
                ? null
                : controller.title.value,
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
            items: controller.titleList
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
                controller.title = value;
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
