import 'package:date_cupertino_bottom_sheet_picker/date_cupertino_bottom_sheet_picker.dart';
import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:intl/intl.dart';
import 'package:resume/config/constant.dart';
import 'package:resume/controller/courses_controller.dart';
import 'package:resume/themes/theme.dart' hide backgroudColorFeild;

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
          style: TextStyleHelper.label10W700BoldOpenSans.copyWith(
            color: AppThemeColors.titleFieldTextcolor,
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
              colors: backgroudColorFeild,
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
                      style: TextStyleHelper.label10W400RegularOpenSans
                          .copyWith(color: Color.fromRGBO(107, 114, 128, 1)),
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

class CupertioDateField extends StatelessWidget {
  final String label;
  final String? hint;
  final void Function(DateTime, String, String)? onTimeChanged;

  const CupertioDateField({
    super.key,
    required this.label,
    this.hint,
    this.onTimeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.theme.brightness == Brightness.dark
              ? TextStyleHelper.label10W700BoldOpenSansDark
              : TextStyleHelper.label10W700BoldOpenSans,
        ),
        const SizedBox(height: 4),
        DateCupertinoBottomSheetPicker(
          minWidth: 1.0,
          height: context.height * 0.045,
          firstDate: DateTime(1990),
          lastDate: DateTime.now(),
          selectedDate: DateTime(1990),
          minAge: 18,

          textFieldDecoration: TextFieldDecoration(
            hintText: hint ?? "Select Date",
            containerPadding: const EdgeInsets.only(top: 0.0),
            containerHeight: context.height * 0.045,
            containerDecoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: context.theme.brightness == Brightness.dark
                    ? [boxColorDark, boxColorDark]
                    : backgroudColorFeild,
              ),
              borderRadius: BorderRadius.circular(4),
            ),

            // Border properties - همه کار می‌کنند ✅
            border: InputBorder.none,
            widthBorder: 0.0,
            widthEnabledBorder: 0.0,
            widthFocusedBorder: 0.0,

            // Fill properties - همه کار می‌کنند ✅
            fillColor: Colors.transparent,
            filled: true,

            // Text properties - همه کار می‌کنند ✅
            style: const TextStyle(
              color: Color.fromRGBO(153, 153, 153, 1),
              fontSize: 10,
              fontWeight: FontWeight.w400,
            ),

            // Icon properties - همه کار می‌کنند ✅
            iconColor: AppThemeColors.colorFF9999,
            iconSize: 16,

            // Layout properties - همه کار می‌کنند ✅
            height: 4.0, // کم شده برای تراز بهتر
            isDense: true,
          ),
          onTimeChanged: onTimeChanged,
          cancelButtonConfig: CancelButtonConfig(
            text: "Cancel",
            color: AppThemeColors.editeFabColor,
            shape: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
          ),
          confirmButtonConfig: ConfirmButtonConfig(
            text: "Confirm",
            color: AppThemeColors.addFabColor,
            shape: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
          ),
        ),
      ],
    );
  }
}
