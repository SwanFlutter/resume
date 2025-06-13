// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/config/constant.dart';
import 'package:resume/themes/theme.dart' hide backgroudColorFeild;

class FileWidget extends StatelessWidget {
  final String label;
  final TextEditingController controllerInstance;
  final String titel;
  final double width;
  final double height;
  final void Function()? onPressed;
  const FileWidget({
    super.key,
    this.label = "Add Content",
    required this.controllerInstance,
    this.titel = 'Upload portfolio *',
    this.width = 134,
    this.height = 36,
    this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titel,
          style: context.theme.brightness == Brightness.dark
              ? TextStyleHelper.body10W400RegularOpenSansDark
              : TextStyleHelper.body10W400RegularOpenSans,
        ),
        SizedBox(height: 5.0),
        Container(
          width: context.width,
          height: 32,
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
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: TextStyleHelper.label10W400RegularOpenSans),
              InkResponse(
                onTap: () {},
                child: SvgPicture.asset(
                  "assets/paperclip-2.svg",
                  width: 14.0,
                  height: 14.0,
                  color: AppThemeColors.colorFF9999,
                ),
              ),
            ],
          ).paddingSymmetric(horizontal: 8.0),
        ),
      ],
    );
  }
}
