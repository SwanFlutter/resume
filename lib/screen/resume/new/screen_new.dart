import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:gradient_textfield/gradient_textfield.dart';
import 'package:resume/config/constant.dart';
import 'package:resume/themes/theme.dart'
    hide backgroudColorFeild, resumeBoxShadowDark, resumeBoxShadow;

class ScreenNew extends StatelessWidget {
  const ScreenNew({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ScreenNew')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: CustomFieldsWidget(
              controllerInstance: TextEditingController(),
              label: 'TTYSDH',
              prefixIcon: true,
              //height: 60,
              hint: "Phone",
            ),
          ),
        ],
      ),
    );
  }
}

class CustomFieldsWidget extends StatelessWidget {
  final String label;
  final TextEditingController controllerInstance;
  final String hint;
  final double? width;
  final double? height;
  final int maxLines;
  final bool prefixIcon;
  final IconData? customPrefixIcon;
  final Color? prefixIconColor;
  final double? prefixIconSize;
  final double vertical;
  final AlignmentGeometry hintAlignment;
  const CustomFieldsWidget({
    super.key,
    required this.label,
    required this.controllerInstance,
    this.hint = '',
    this.width,
    this.height,
    this.maxLines = 3,
    this.prefixIcon = false,
    this.vertical = 0.0,
    this.customPrefixIcon,
    this.prefixIconColor,
    this.prefixIconSize,
    this.hintAlignment = Alignment.centerLeft,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.theme.brightness == Brightness.dark
              ? TextStyleHelper.label10W700BoldOpenSansDark
              : TextStyleHelper.label10W700BoldOpenSans,
        ).paddingOnly(left: context.width > 600 ? 4.0 : 3.0),
        SizedBox(height: context.width > 600 ? 6.0 : 4.0),
        GradientTextField(
          maxWidth: 0.6,
          height: height ?? 40,
          controller: controllerInstance,
          hint: hint,
          hintAlignment: hintAlignment,
          enableAnimations: false,
          prefixIconAsset: prefixIcon ? "assets/calendar-2.svg" : null,
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.center,
          iconColor: context.theme.brightness == Brightness.dark
              ? Colors.white
              : AppThemeColors.colorFF0407,
          iconSize: 14.0, // Fix: Reduced from 35.0 to reasonable size
          iconPadding: const EdgeInsets.only(right: 8.0),
          style: TextStyle(fontSize: 14),
          shadowConfiguration: ShadowConfiguration.boxShadow(
            enabled: false,
            boxShadows: context.theme.brightness == Brightness.dark
                ? [resumeBoxShadowDark]
                : [resumeBoxShadow],
          ),
          gradientBackgroundConfiguration: GradientBackgroundConfiguration(
            borderRadius: 8.0,
            borderColor: context.theme.brightness == Brightness.dark
                ? feildBorderColorDark
                : feildBorderColor,
            backgroundGradientColors:
                context.theme.brightness == Brightness.dark
                ? [boxColorDark, boxColorDark]
                : backgroudColorFeild,
          ),
        ),
      ],
    );
  }
}



/*class CustomFieldsWidget extends StatelessWidget {
  final String label;
  final TextEditingController controllerInstance;
  final String hint;
  final double? width;
  final double? height;
  final int maxLines;
  final bool prefixIcon;
  final IconData? customPrefixIcon;
  final Color? prefixIconColor;
  final double? prefixIconSize;
  final double vertical;
  final AlignmentGeometry hintAlignment;

  const CustomFieldsWidget({
    super.key,
    required this.label,
    required this.controllerInstance,
    this.hint = '',
    this.width,
    this.height,
    this.maxLines = 3,
    this.prefixIcon = false,
    this.vertical = 0.0,
    this.customPrefixIcon,
    this.prefixIconColor,
    this.prefixIconSize,
    this.hintAlignment = Alignment.centerLeft,
  });

  // Helper method to calculate proper vertical padding for text centering
  double _calculateVerticalPadding(BuildContext context) {
    final fieldHeight = height ?? MediaQuery.of(context).size.height * 0.045;

    if (maxLines > 1) {
      // For multiline fields, use less padding
      return fieldHeight > 60 ? 12.0 : 8.0;
    } else {
      // For single line fields, calculate padding to center text
      return fieldHeight > 40 ? 12.0 : 10.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.theme.brightness == Brightness.dark
              ? TextStyleHelper.label10W700BoldOpenSansDark
              : TextStyleHelper.label10W700BoldOpenSans,
        ).paddingOnly(left: context.width > 600 ? 4.0 : 3.0),
        SizedBox(height: context.width > 600 ? 6.0 : 4.0),
        GradientTextField(
          maxWidth: 1.0,
          height: height ?? 40,
          controller: controllerInstance,
          hint: hint,
          hintAlignment: hintAlignment,

          // Fix 2: Remove conflicting decoration that prevents hint display
          decoration: const InputDecoration(
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            contentPadding: EdgeInsets.zero,
            // Remove hintStyle from here - it conflicts with the widget's hint system
          ),

          prefixIconAsset: prefixIcon ? "assets/calendar-2.svg" : null,

          iconColor: context.theme.brightness == Brightness.dark
              ? Colors.white
              : AppThemeColors.colorFF0407,
          iconSize: 20.0, // Fix: Reduced from 35.0 to reasonable size
          iconPadding: const EdgeInsets.only(right: 8.0),
          shadowBlurRadius: 0.0,
          gradientBackgroundConfiguration: GradientBackgroundConfiguration(
            borderColor: context.theme.brightness == Brightness.dark
                ? feildBorderColorDark
                : feildBorderColor,

            // Fix 4: Proper content padding for text centering
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),

            backgroundGradientColors:
                context.theme.brightness == Brightness.dark
                ? [boxColorDark, boxColorDark]
                : backgroudColorFeild,

            begin: Alignment(1.03, -0.08),
            end: Alignment(-0.02, 1.00),
          ),
          style: TextStyleHelper.label10W400RegularOpenSans.copyWith(
            color: context.theme.brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
            fontSize: 12,
          ),
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.center,
        ),
      ],
    );
  }
}
*/