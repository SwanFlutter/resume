import 'package:flutter/material.dart';

const Color addFabColor = Color.fromRGBO(30, 51, 99, 1);
const Color editeFabColor = Color.fromRGBO(253, 27, 81, 1);
const Color titleFieldTextcolor = Color.fromRGBO(7, 14, 7, 1);
const Color navColorIcon = Color.fromRGBO(7, 14, 7, 0.5);
const List<Color> fieldColor = [
  /// background: linear-gradient(267.34deg, #FBF1EF -3.51%, #FCF8F8 31.64%, #F9F0F0 66.79%, #FCF4F3 101.93%);
];

const List<Color> backgroundColors = [
  Color(0xFFFEDEE6),
  Color.fromRGBO(255, 255, 255, 1),
  Color.fromRGBO(255, 255, 255, 0.6),
];

double dynamicHeight({
  required BuildContext context,
  required double fixedHeight,
}) {
  // Get the screen height
  double screenHeight = MediaQuery.of(context).size.height;

  // Calculate the dynamic height based on the screen height
  double dynamicHeight =
      (fixedHeight / screenHeight) *
      screenHeight; // Assuming 800 is a reference screen height
  return dynamicHeight;
}
