import 'package:flutter/material.dart';
import 'package:resume/controller/resume_controller.dart';

class DescriptionsEditeInfoWidget extends StatelessWidget {
  final ResumeController controller;
  final String hint;
  const DescriptionsEditeInfoWidget({
    super.key,
    required this.controller,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 292,
      height: 96,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(251, 241, 239, 1),
            Color.fromRGBO(252, 248, 248, 1),
            Color.fromRGBO(249, 240, 240, 1),
            Color.fromRGBO(252, 244, 243, 1),
          ],
        ),
      ),
      child: TextField(
        controller: controller.description,
        maxLines: 4,
        decoration: InputDecoration(
          hint: Text(
            hint,
            style: TextStyle(
              fontSize: 10.0,
              color: Color.fromRGBO(153, 153, 153, 1),
            ),
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(8.0),
        ),
      ),
    );
  }
}
