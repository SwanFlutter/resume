/*import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/config/constant.dart';

class CustomFieldsWidget extends StatelessWidget {
  final String label;
  final TextEditingController controllerInstance;
  final String hint;
  final double width;
  final double? height;
  final int maxLines;
  final bool prefixIcon;
  final IconData? customPrefixIcon;
  final Color? prefixIconColor;
  final double? prefixIconSize;
  final double vertical;
  const CustomFieldsWidget({
    super.key,
    required this.label,
    required this.controllerInstance,
    this.hint = '',
    this.width = 134,
    this.height,
    this.maxLines = 3,
    this.prefixIcon = false,
    this.vertical = 0.0,
    this.customPrefixIcon,
    this.prefixIconColor,
    this.prefixIconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyleHelper.label10W700BoldOpenSans.copyWith(
            color: AppThemeColors.titleFieldTextcolor,
          ),
        ).paddingOnly(left: 3.0),
        SizedBox(height: 4.0),
        Container(
          width: width,
          height: height ?? context.height * 0.045,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: backgroudColorFeild,
            ),
            borderRadius: BorderRadius.circular(4.0),
            border: Border.all(
              color: Color.fromRGBO(220, 240, 249, 0.4),
              width: 1.0,
            ),
          ),
          child: TextField(
            maxLines: maxLines,
            controller: controllerInstance,
            textAlign: TextAlign.left,
            textAlignVertical: TextAlignVertical.center,
            style: TextStyleHelper.label10W400RegularOpenSans.copyWith(
              color: Color.fromRGBO(107, 114, 128, 1),
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: vertical,
              ),
              hintText: hint,
              hintStyle: TextStyleHelper.label10W400RegularOpenSans.copyWith(
                color: Color.fromRGBO(153, 153, 153, 1),
              ),
              // استفاده از prefixIcon بجای label
              prefixIcon: (prefixIcon || customPrefixIcon != null)
                  ? Padding(
                      padding: EdgeInsets.only(left: 8.0, right: 4.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            "assets/calendar-2.svg",
                            width: 14,
                            height: 14,
                          ),
                        ],
                      ),
                    )
                  : null,
              prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/config/constant.dart';

class CustomFieldsWidget extends StatelessWidget {
  final String label;
  final TextEditingController controllerInstance;
  final String hint;
  final double? width; // اختیاری کردن width
  final double? height;
  final int maxLines;
  final bool prefixIcon;
  final IconData? customPrefixIcon;
  final Color? prefixIconColor;
  final double? prefixIconSize;
  final double vertical;

  const CustomFieldsWidget({
    super.key,
    required this.label,
    required this.controllerInstance,
    this.hint = '',
    this.width, // حذف مقدار پیش‌فرض
    this.height,
    this.maxLines = 3,
    this.prefixIcon = false,
    this.vertical = 0.0,
    this.customPrefixIcon,
    this.prefixIconColor,
    this.prefixIconSize,
  });

  // محاسبه عرض بر اساس اندازه صفحه
  double _getResponsiveWidth(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (width != null) return width!;

    // تعریف عرض بر اساس اندازه صفحه
    if (screenWidth > 1200) {
      return screenWidth * 0.12; // Desktop بزرگ
    } else if (screenWidth > 800) {
      return screenWidth * 0.15; // Desktop/Tablet
    } else if (screenWidth > 600) {
      return screenWidth * 0.25; // Tablet کوچک
    } else {
      return screenWidth * 0.35; // Mobile
    }
  }

  // محاسبه ارتفاع بر اساس اندازه صفحه
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

  // محاسبه اندازه فونت بر اساس اندازه صفحه
  double _getResponsiveFontSize(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth > 800) {
      return 10.0; // Desktop
    } else if (screenWidth > 600) {
      return 9.0; // Tablet
    } else {
      return 8.0; // Mobile
    }
  }

  // محاسبه padding بر اساس اندازه صفحه
  EdgeInsets _getResponsivePadding(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth > 800) {
      return EdgeInsets.symmetric(horizontal: 12.0, vertical: vertical + 2.0);
    } else if (screenWidth > 600) {
      return EdgeInsets.symmetric(horizontal: 10.0, vertical: vertical + 1.0);
    } else {
      return EdgeInsets.symmetric(horizontal: 8.0, vertical: vertical);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final responsiveWidth = _getResponsiveWidth(context);
        final responsiveHeight = _getResponsiveHeight(context);
        final responsiveFontSize = _getResponsiveFontSize(context);
        final responsivePadding = _getResponsivePadding(context);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyleHelper.label10W700BoldOpenSans.copyWith(
                color: AppThemeColors.titleFieldTextcolor,
                fontSize: responsiveFontSize + 1, // کمی بزرگتر از متن داخل فیلد
              ),
            ).paddingOnly(
              left: MediaQuery.of(context).size.width > 600 ? 4.0 : 3.0,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width > 600 ? 6.0 : 4.0,
            ),
            Container(
              width: responsiveWidth,
              height: responsiveHeight,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: backgroudColorFeild,
                ),
                borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.width > 600 ? 6.0 : 4.0,
                ),
                border: Border.all(
                  color: Color.fromRGBO(220, 240, 249, 0.4),
                  width: 1.0,
                ),
              ),
              child: TextField(
                maxLines: maxLines,
                controller: controllerInstance,
                textAlign: TextAlign.left,
                textAlignVertical: TextAlignVertical.center,
                style: TextStyleHelper.label10W400RegularOpenSans.copyWith(
                  color: Color.fromRGBO(107, 114, 128, 1),
                  fontSize: responsiveFontSize,
                ),
                decoration: InputDecoration(
                  contentPadding: responsivePadding,
                  hintText: hint,
                  hintStyle: TextStyleHelper.label10W400RegularOpenSans
                      .copyWith(
                        color: Color.fromRGBO(153, 153, 153, 1),
                        fontSize: responsiveFontSize,
                      ),
                  prefixIcon: (prefixIcon || customPrefixIcon != null)
                      ? Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width > 600
                                ? 10.0
                                : 8.0,
                            right: MediaQuery.of(context).size.width > 600
                                ? 6.0
                                : 4.0,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                "assets/calendar-2.svg",
                                width: MediaQuery.of(context).size.width > 600
                                    ? 16
                                    : 14,
                                height: MediaQuery.of(context).size.width > 600
                                    ? 16
                                    : 14,
                              ),
                            ],
                          ),
                        )
                      : null,
                  prefixIconConstraints: BoxConstraints(
                    minWidth: 0,
                    minHeight: 0,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
