import 'package:flutter/material.dart';
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
