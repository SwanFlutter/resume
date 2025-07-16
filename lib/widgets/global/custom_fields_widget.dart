import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:gradient_textfield/gradient_textfield.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resume/config/constant.dart' hide resumeBoxShadow;
import 'package:resume/config/extentions/extension_on_flutter.dart';
import 'package:resume/themes/theme.dart'
    hide backgroudColorFeildDark, backgroudColorFeild, resumeBoxShadowDark;

class CustomFieldsWidget1 extends StatelessWidget {
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

  const CustomFieldsWidget1({
    super.key,
    required this.label,
    required this.controllerInstance,
    this.hint = '',
    this.width, // حذف مقدار پیش‌فرض
    this.height,
    this.maxLines = 3,
    this.prefixIcon = false,
    this.vertical = 0.0,
    this.customPrefixIcon,
    this.prefixIconColor,
    this.prefixIconSize,
  });

  // محاسبه عرض بر اساس اندازه صفحه
  double _getResponsiveWidth(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (width != null) return width!;

    // تعریف عرض بر اساس اندازه صفحه
    if (screenWidth > 1200) {
      return screenWidth * 0.12; // Desktop بزرگ
    } else if (screenWidth > 800) {
      return screenWidth * 0.15; // Desktop/Tablet
    } else if (screenWidth > 600) {
      return screenWidth * 0.25; // Tablet کوچک
    } else {
      return screenWidth * 0.35; // Mobile
    }
  }

  // محاسبه ارتفاع بر اساس اندازه صفحه
  double _getResponsiveHeight(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    if (height != null) return height!;

    // تعریف ارتفاع بر اساس اندازه صفحه
    if (screenHeight > 800) {
      return screenHeight * 0.045; // صفحه‌های بزرگ
    } else if (screenHeight > 600) {
      return screenHeight * 0.05; // صفحه‌های متوسط
    } else {
      return screenHeight * 0.055; // صفحه‌های کوچک
    }
  }

  // محاسبه اندازه فونت بر اساس اندازه صفحه
  double _getResponsiveFontSize(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth > 800) {
      return 10.0; // Desktop
    } else if (screenWidth > 600) {
      return 9.0; // Tablet
    } else {
      return 8.0; // Mobile
    }
  }

  // محاسبه padding بر اساس اندازه صفحه
  EdgeInsets _getResponsivePadding(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth > 800) {
      return EdgeInsets.symmetric(horizontal: 12.0, vertical: vertical + 2.0);
    } else if (screenWidth > 600) {
      return EdgeInsets.symmetric(horizontal: 10.0, vertical: vertical + 1.0);
    } else {
      return EdgeInsets.symmetric(horizontal: 8.0, vertical: vertical);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final responsiveWidth = _getResponsiveWidth(context);
        final responsiveHeight = _getResponsiveHeight(context);
        final responsiveFontSize = _getResponsiveFontSize(context);
        final responsivePadding = _getResponsivePadding(context);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyleHelper.label10W700BoldOpenSans,
            ).paddingOnly(
              left: MediaQuery.of(context).size.width > 600 ? 4.0 : 3.0,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width > 600 ? 6.0 : 4.0,
            ),
            Container(
              width: responsiveWidth,
              height: responsiveHeight,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: backgroudColorFeild,
                ),
                borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.width > 600 ? 6.0 : 4.0,
                ),
                border: Border.all(
                  color: Color.fromRGBO(220, 240, 249, 0.4),
                  width: 1.0,
                ),
              ),
              child: TextField(
                maxLines: maxLines,

                controller: controllerInstance,
                textAlign: TextAlign.left,
                textAlignVertical: TextAlignVertical.center,
                style: TextStyleHelper.label10W400RegularOpenSans.copyWith(
                  color: Color.fromRGBO(107, 114, 128, 1),
                  fontSize: responsiveFontSize,
                ),
                decoration: InputDecoration(
                  contentPadding: responsivePadding,
                  hintText: hint,
                  hintStyle: TextStyleHelper.label10W400RegularOpenSans,
                  prefixIcon: (prefixIcon || customPrefixIcon != null)
                      ? Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width > 600
                                ? 10.0
                                : 8.0,
                            right: MediaQuery.of(context).size.width > 600
                                ? 6.0
                                : 4.0,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                "assets/calendar-2.svg",
                                width: MediaQuery.of(context).size.width > 600
                                    ? 16
                                    : 14,
                                height: MediaQuery.of(context).size.width > 600
                                    ? 16
                                    : 14,
                              ),
                            ],
                          ),
                        )
                      : null,
                  prefixIconConstraints: BoxConstraints(
                    minWidth: 0,
                    minHeight: 0,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class CustomFieldsWidget extends StatefulWidget {
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
  final bool isImagePicker;
  final void Function(File?)? onImagePicked;

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
    this.isImagePicker = false,
    this.onImagePicked,
  });

  @override
  State<CustomFieldsWidget> createState() => _CustomFieldsWidgetState();
}

class _CustomFieldsWidgetState extends State<CustomFieldsWidget> {
  File? _pickedImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _pickedImage = File(pickedFile.path);
      });
      if (widget.onImagePicked != null) {
        widget.onImagePicked!(_pickedImage);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.label,
          style: context.theme.brightness == Brightness.dark
              ? TextStyleHelper.label10W700BoldOpenSansDark
              : TextStyleHelper.label10W700BoldOpenSans,
        ).paddingOnly(left: context.width > 600 ? 4.0 : 3.0),
        SizedBox(height: context.width > 600 ? 6.0 : 4.0),
        if (widget.isImagePicker)
          Row(
            children: [
              ElevatedButton.icon(
                onPressed: _pickImage,
                icon: Icon(Icons.image),
                label: Text('انتخاب تصویر'),
              ),
              SizedBox(width: 12),
              _pickedImage != null
                  ? Image.file(
                      _pickedImage!,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    )
                  : Text('تصویری انتخاب نشده'),
            ],
          ),
        GradientTextField(
          maxWidth: 1.0,
          height: widget.height ?? context.height * 0.049,
          controller: widget.controllerInstance,
          hint: widget.hint,
          hintAlignment: widget.hintAlignment,
          enableAnimations: false,
          prefixIconAsset: widget.prefixIcon ? "assets/calendar-2.svg" : null,
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            hintStyle: TextStyleHelper.label10W400RegularOpenSans.copyWith(
              fontSize: ResponsiveFontSize(7).ssp,
            ),
          ),
          iconColor: context.theme.brightness == Brightness.dark
              ? Colors.white
              : AppThemeColors.colorFF0407,
          iconSize: 14.0,
          iconPadding: const EdgeInsets.only(right: 8.0),
          style: TextStyle(fontSize: 14, color: AppThemeColors.colorFF0407),
          shadowConfiguration: ShadowConfiguration.disabled(),
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







/*-class CustomFieldsWidget extends StatelessWidget {
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