import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/config/constant.dart';

class CustomChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final horizontalPadding = context.width * 0.04; // مثلاً 4٪ از عرض صفحه
    final verticalPadding = context.height * 0.003; // مثلاً 0.5٪ از ارتفاع
    final horizontalMargin = context.width * 0.004; // مثلاً 1٪
    final verticalMargin = context.height * 0.0025; // مثلاً 0.25٪
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        margin: EdgeInsets.symmetric(
          horizontal: horizontalMargin,
          vertical: verticalMargin,
        ),
        //    height: 20.0,
        decoration: BoxDecoration(
          color: isSelected
              ? (Theme.of(context).brightness == Brightness.dark
                    ? const Color.fromRGBO(12, 21, 42, 1)
                    : const Color.fromRGBO(190, 196, 210, 1))
              : (Theme.of(context).brightness == Brightness.dark
                    ? Colors.transparent
                    : const Color.fromRGBO(222, 225, 232, 0.4)),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          label,
          selectionColor: context.theme.brightness == Brightness.dark
              ? Colors.white
              : AppThemeColors.colorFF0407,
          style: TextStyle(
            fontSize: 10,
            color: context.theme.brightness == Brightness.dark
                ? Colors.white
                : AppThemeColors.colorFF0407,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            overflow: TextOverflow.ellipsis,
          ),
          textScaler: const TextScaler.linear(0.9),
        ),
      ),
    );
  }
}
