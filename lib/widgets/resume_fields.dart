import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:intl/intl.dart';

import '../controller/resume_controller.dart';

class RegularTextFieldWidget extends StatelessWidget {
  final ResumeController controller;
  final String label;
  final TextEditingController controllerInstance;
  const RegularTextFieldWidget({
    super.key,
    required this.controller,
    required this.label,
    required this.controllerInstance,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 10.0, color: Color.fromRGBO(4, 7, 14, 1)),
        ),
        SizedBox(height: 4),
        Container(
          alignment: Alignment.centerLeft, // Changed from Alignment.center
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
            controller: controllerInstance,
            textAlign: TextAlign.start, // Add this line
            style: TextStyle(
              fontSize: 10.0,
              color: Color.fromRGBO(107, 114, 128, 1),
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
        ),
      ],
    );
  }
}

class DateTextFieldWidget extends StatelessWidget {
  final ResumeController controller;
  const DateTextFieldWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Date Of Birth *',
          style: TextStyle(
            fontSize: 10.0,
            color: Color.fromRGBO(107, 114, 128, 1),
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

class DatePickerWidget extends StatelessWidget {
  final ResumeController controller;
  const DatePickerWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Date Of Birth *',
          style: TextStyle(
            fontSize: 10.0,
            color: Color.fromRGBO(107, 114, 128, 1),
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

class MilitaryStatusWidget extends StatelessWidget {
  final ResumeController controller;
  const MilitaryStatusWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Military Service Status *',
          style: TextStyle(
            fontSize: 10.0,
            color: Color.fromRGBO(107, 114, 128, 1),
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
            value: controller.textSecndery.text.isEmpty
                ? null
                : controller.textSecndery.text,
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
            items: ['Completed', 'Exempted', 'Not Completed', 'Not Applicable']
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
                controller.textSecndery.text = value;
                controller.update();
              }
            },
            hint: Text(
              'Select Status',
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
