import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:resume/config/constant.dart';
import 'package:resume/controller/resume_controller.dart';

class DateTextFieldWidget extends StatelessWidget {
  final ResumeController controller;
  final String label;
  final String? hint;
  const DateTextFieldWidget({
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
              colors: [
                Color.fromRGBO(251, 241, 239, 1),
                Color.fromRGBO(252, 248, 248, 1),
                Color.fromRGBO(249, 240, 240, 1),
                Color.fromRGBO(252, 244, 243, 1),
              ],
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
