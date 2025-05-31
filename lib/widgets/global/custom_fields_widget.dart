import 'package:flutter/material.dart';
import 'package:resume/config/constant.dart';

class CustomFieldsWidget extends StatelessWidget {
  final String label;
  final TextEditingController controllerInstance;
  final String hint;
  final double width;
  final double height;
  final int maxLines;

  const CustomFieldsWidget({
    super.key,
    required this.label,
    required this.controllerInstance,
    this.hint = '',
    this.width = 134,
    this.height = 32,
    this.maxLines = 3,
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
        ),
        SizedBox(height: 4.0),
        Container(
          width: width,
          height: height,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: backgroudColorFeild,
            ),
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: TextField(
            maxLines: maxLines,
            controller: controllerInstance,
            textAlign: TextAlign.left, // Align text to the left
            style: TextStyleHelper.label10W400RegularOpenSans.copyWith(
              color: Color.fromRGBO(107, 114, 128, 1),
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                left: 8.0,
                top: 5.0, // Add padding only on the left
              ),
              hintText: hint,
              hintStyle: TextStyleHelper.label10W400RegularOpenSans.copyWith(
                color: Color.fromRGBO(153, 153, 153, 1),
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
