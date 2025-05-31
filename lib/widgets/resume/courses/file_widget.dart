import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/config/constant.dart';
import 'package:resume/config/extentions/extension_on_flutter.dart';

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
          style: TextStyle(
            color: AppThemeColors.titleFieldTextcolor,
            fontWeight: FontWeight.w400,
            fontSize: 10.0,
          ),
        ),
        SizedBox(height: 5.0),
        Container(
          width: context.width,
          height: 32,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: backgroudColorFeild,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: TextStyle(color: Color.fromRGBO(153, 153, 153, 1)),
              ).padOnly(left: 5.0),
              IconButton(
                onPressed: onPressed,
                icon: Icon(Icons.attach_file, size: 14.0),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
