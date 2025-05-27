import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Alignment begin;
  final Alignment end;

  const CardWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.begin,
    required this.end,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 76,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.5), // رنگ سایه
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Color.fromRGBO(253, 27, 81, 0.2)),
        gradient: LinearGradient(
          begin: begin,
          end: end,
          colors: [Colors.white, Color.fromRGBO(254, 222, 230, 1)],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Icon(icon), Text(text)],
      ),
    );
  }
}
