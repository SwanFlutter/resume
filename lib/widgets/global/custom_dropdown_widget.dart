import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/config/constant.dart';
import 'package:resume/controller/courses_controller.dart';
import 'package:resume/themes/theme.dart' hide backgroudColorFeild;

class CustomDropdownWidget<T extends GetXController> extends StatelessWidget {
  final T controller;
  final String label;
  final double width;
  final double? height;
  final double? height;
  final String? title; // Make title nullable
  final List<String> titleList;
  final String dropdownId; // Unique identifier for this dropdown instance
  final Function(String)? onChanged; // Optional callback for custom handling

  const CustomDropdownWidget({
    super.key,
    required this.controller,
    required this.label,
    required this.dropdownId, // Required unique ID
    this.title, // Make title optional
    required this.titleList,
    this.onChanged,
    this.width = 134,
    this.height,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    // Remove duplicates from titleList
    final uniqueTitleList = titleList.toSet().toList();

    return GetBuilder<CoursesController>(
      builder: (controller) {
        // Get the current value for this specific dropdown
        String? currentValue = controller.getDropdownValue(dropdownId) ?? title;

        // Ensure the current value is in the list, otherwise set to null
        if (currentValue != null && !uniqueTitleList.contains(currentValue)) {
          currentValue = null;
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: context.theme.brightness == Brightness.dark
                  ? TextStyleHelper.label10W700BoldOpenSansDark.copyWith(
                      fontWeight: FontWeight.w800,
                    )
                  : TextStyleHelper.label10W700BoldOpenSans.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
            ),
            SizedBox(height: 4),
            Container(
              width: width,
              height: _getResponsiveHeight(context),
              decoration: BoxDecoration(
                border: Border.all(
                  color: context.theme.brightness == Brightness.dark
                      ? feildBorderColorDark
                      : feildBorderColor,
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: context.theme.brightness == Brightness.dark
                      ? [boxColorDark, boxColorDark]
                      : backgroudColorFeild,
                ),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: DropdownButton<String>(
                value: currentValue,
                dropdownColor: context.theme.brightness == Brightness.dark
                    ? boxColorDark
                    : backgroudColorFeild.first,
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
                items: uniqueTitleList
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
                    // Update the value for this specific dropdown
                    controller.updateDropdownValue(dropdownId, value);

                    // Call custom callback if provided
                    if (onChanged != null) {
                      onChanged!(value);
                    }
                  }
                },
                hint: Text(
                  title!,
                  style: TextStyle(
                    fontSize: 10.0,
                    color: Color.fromRGBO(107, 114, 128, 1),
                  ),
                ).paddingOnly(left: 10.0),
              ),
            ),
          ],
        );
      },
    );
  }

  double _getResponsiveHeight(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    if (height != null) return height!;

    // تعریف ارتفاع بر اساس اندازه صفحه
    if (screenHeight > 800) {
      return screenHeight * 0.045; // صفحه‌های بزرگ
    } else if (screenHeight > 600) {
      return screenHeight * 0.05; // صفحه‌های متوسط
    } else {
      return screenHeight * 0.055; // صفحه‌های کوچک
    }
  }
}
