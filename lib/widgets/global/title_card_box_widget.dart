import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/config/constant.dart';

class TitleCardBoxWidget extends StatelessWidget {
  final String title;
  const TitleCardBoxWidget({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: context.theme.brightness == Brightness.dark
          ? TextStyleHelper.title14W400RegularOpenSansDark
          : TextStyleHelper.title14W400RegularOpenSans,
    );
  }
}
