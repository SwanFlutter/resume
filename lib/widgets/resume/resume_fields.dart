import 'package:flutter/material.dart';

class RegularTextFieldWidget extends StatelessWidget {
  final String label;
  final TextEditingController controllerInstance;
  final String hint;
  final double width;
  final double height;

  const RegularTextFieldWidget({
    super.key,
    required this.label,
    required this.controllerInstance,
    this.hint = '',
    this.width = 134,
    this.height = 32,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start, // Centers children horizontally
      mainAxisAlignment:
          MainAxisAlignment.center, // Centers children vertically
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 10.0,
            color: Color.fromRGBO(4, 7, 14, 1),
            fontWeight: FontWeight.w800,
          ),
        ),

        Container(
          alignment: Alignment.center,
          width: width,
          height: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(251, 241, 239, 1),
                Color.fromRGBO(252, 248, 248, 1),
                Color.fromRGBO(249, 240, 240, 1),
                Color.fromRGBO(252, 244, 243, 1),
              ],
            ),
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: TextField(
            maxLines: 1,
            controller: controllerInstance,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 10.0,
              color: Color.fromRGBO(107, 114, 128, 1),
            ),
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
        ),
      ],
    );
  }
}
