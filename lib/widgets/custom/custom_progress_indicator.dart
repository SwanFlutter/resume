import 'dart:math' as math;

import 'package:flutter/material.dart';

/// CustomProgressIndicator - پراگرس دایره‌ای حرفه‌ای با گرادیانت
///
/// ویژگی‌ها:
/// - دو پراگرس روی هم (قابل تنظیم)
/// - گرادیانت چند رنگ
/// - انیمیشن smooth
/// - متن درصد با گرادیانت
/// - قابلیت تنظیم کامل
class CustomProgressIndicator extends StatefulWidget {
  /// درصد پراگرس اصلی (0-100)
  final int progress;

  /// لیست رنگ‌های گرادیانت
  final List<Color> gradientColors;

  /// اندازه کل widget
  final double size;

  /// نمایش متن درصد
  final bool isVisiblePersentText;

  /// نمایش دو پراگرس روی هم
  final bool showDoubleProgress;

  /// درصد پراگرس دوم (اختیاری - پیش‌فرض 70% پراگرس اصلی)
  final int? secondaryProgress;

  /// ضخامت خط پراگرس
  final double strokeWidth;

  /// مدت زمان انیمیشن
  final Duration animationDuration;

  /// استایل متن سفارشی
  final TextStyle? textStyle;

  const CustomProgressIndicator({
    super.key,
    required this.progress,
    this.gradientColors = const [
      Color(0xFF6A11CB), // بنفش
      Color(0xFF2575FC), // آبی
      Color(0xFF00C9FF), // آبی روشن
      Color(0xFF92FE9D), // سبز
    ],
    this.size = 80,
    this.isVisiblePersentText = true,
    this.showDoubleProgress = true,
    this.secondaryProgress,
    this.strokeWidth = 6,
    this.animationDuration = const Duration(milliseconds: 1500),
    this.textStyle,
  }) : assert(
         progress >= 0 && progress <= 100,
         'Progress must be between 0 and 100',
       );

  @override
  State<CustomProgressIndicator> createState() =>
      _CustomProgressIndicatorState();
}

class _CustomProgressIndicatorState extends State<CustomProgressIndicator>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _progressAnimation;
  late Animation<double> _secondaryProgressAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _animationController.forward();
  }

  void _setupAnimations() {
    _animationController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );

    // انیمیشن پراگرس اصلی
    _progressAnimation = Tween<double>(begin: 0.0, end: widget.progress / 100.0)
        .animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOutCubic,
          ),
        );

    // انیمیشن پراگرس ثانویه
    final secondaryValue =
        widget.secondaryProgress ?? (widget.progress * 0.7).round();
    _secondaryProgressAnimation =
        Tween<double>(begin: 0.0, end: secondaryValue / 100.0).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOutCubic,
          ),
        );

    // انیمیشن scale برای جلوه بصری بهتر
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.elasticOut),
    );
  }

  @override
  void didUpdateWidget(CustomProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.progress != widget.progress ||
        oldWidget.secondaryProgress != widget.secondaryProgress) {
      _setupAnimations();
      _animationController.reset();
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // پراگرس بزرگ (اصلی)
              SizedBox(
                width: widget.size,
                height: widget.size,
                child: CustomPaint(
                  painter: GradientCircularProgressPainter(
                    progress: _progressAnimation.value,
                    gradientColors: widget.gradientColors,
                    strokeWidth: widget.strokeWidth,
                    backgroundColor: Colors.grey.withValues(alpha: 0.15),
                  ),
                ),
              ),

              // پراگرس کوچک (ثانویه) - فقط اگر showDoubleProgress فعال باشد
              if (widget.showDoubleProgress)
                SizedBox(
                  width: widget.size * 0.65,
                  height: widget.size * 0.65,
                  child: CustomPaint(
                    painter: GradientCircularProgressPainter(
                      progress: _secondaryProgressAnimation.value,
                      gradientColors: [
                        widget.gradientColors.last,
                        widget.gradientColors.first,
                      ],
                      strokeWidth: widget.strokeWidth * 0.7,
                      backgroundColor: Colors.grey.withValues(alpha: 0.1),
                    ),
                  ),
                ),

              // متن درصد با گرادیانت
              if (widget.isVisiblePersentText)
                ShaderMask(
                  shaderCallback: (bounds) => LinearGradient(
                    colors: widget.gradientColors,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ).createShader(bounds),
                  child: Text(
                    '${(_progressAnimation.value * 100).round()}%',
                    style: widget.textStyle,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

/// کلاس Painter برای رسم پراگرس دایره‌ای با گرادیانت
class GradientCircularProgressPainter extends CustomPainter {
  final double progress;
  final List<Color> gradientColors;
  final double strokeWidth;
  final Color backgroundColor;

  GradientCircularProgressPainter({
    required this.progress,
    required this.gradientColors,
    required this.strokeWidth,
    required this.backgroundColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    // رسم پس‌زمینه دایره
    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, backgroundPaint);

    // رسم پراگرس با گرادیانت
    if (progress > 0) {
      final rect = Rect.fromCircle(center: center, radius: radius);

      final gradient = SweepGradient(
        colors: gradientColors,
        stops: List.generate(
          gradientColors.length,
          (index) => index / (gradientColors.length - 1),
        ),
        startAngle: -math.pi / 2,
        endAngle: -math.pi / 2 + (2 * math.pi * progress),
      );

      final progressPaint = Paint()
        ..shader = gradient.createShader(rect)
        ..strokeWidth = strokeWidth
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round;

      canvas.drawArc(
        rect,
        -math.pi / 2,
        2 * math.pi * progress,
        false,
        progressPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
