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
    this.height = 36,
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
          alignment: Alignment
              .center, // Ensures the TextField is centered within the Container
          width: width,
          height: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Color.fromRGBO(254, 222, 230, 1)],
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
