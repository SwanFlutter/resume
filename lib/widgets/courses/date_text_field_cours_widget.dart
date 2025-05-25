import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:resume/config/constant.dart';
import 'package:resume/controller/courses_controller.dart';

class DateTextFielCoursdWidget extends StatelessWidget {
  final CoursesController controller;
  final String label;
  final String? hint;
  const DateTextFielCoursdWidget({
    super.key,
    required this.controller,
    required this.label,
    this.hint,
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
            color: titleFieldTextcolor,
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
          child: InkWell(
            onTap: () async {
              final DateTime picked = await controller.pickerTime(context);
              controller.dateTime.text = DateFormat(
                'yyyy-MM-dd',
              ).format(picked);
              controller.update();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      controller.dateTime.text.isEmpty
                          ? 'Select Date'
                          : controller.dateTime.text,
                      style: TextStyle(
                        fontSize: 10.0,
                        color: Color.fromRGBO(107, 114, 128, 1),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.calendar_today,
                    size: 16,
                    color: Color.fromRGBO(107, 114, 128, 1),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
