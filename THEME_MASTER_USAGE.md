# استفاده از Theme Master در پروژه Resume

## مشکل اصلی و راه حل

### مشکل قبلی:
```dart
// ❌ این کد خطا می‌داد
final themeController = ThemeController.to; // خطا: ThemeController not found
```

### راه حل:
```dart
// ✅ کد درست
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MyBindings().dependencies(); // ابتدا dependencies را initialize کنید
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeControllers>(
      builder: (themeController) {
        return ThemeMaster(
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeController.themeMode,
          child: GetMaterialApp(
            // ... rest of your app
          ),
        );
      },
    );
  }
}
```

## فایل‌های اصلاح شده:

### 1. `lib/main.dart`
- اضافه شدن `import 'package:theme_master/theme_master.dart'`
- تغییر ترتیب initialization
- استفاده از `GetBuilder` و `ThemeMaster`

### 2. `lib/controller/theme_controller.dart`
- اضافه شدن reactive state با `Rx<ThemeMode>`
- بهبود متدهای کنترل theme

### 3. `lib/themes/theme.dart`
- پیکربندی کامل `ExtendedThemeData` با gradient ها
- استفاده از رنگ‌های موجود در پروژه شما

### 4. `pubspec.yaml`
- اضافه شدن dependency به theme_master با path نسبی

## نحوه استفاده از Gradient ها:

### 1. App Bar با Gradient:
```dart
AppBar(
  flexibleSpace: Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: context.appBarGradientColors,
      ),
    ),
  ),
)
```

### 2. Card با Gradient:
```dart
Container(
  decoration: BoxDecoration(
    gradient: LinearGradient(
      colors: context.cardGradientColors,
    ),
    borderRadius: BorderRadius.circular(12),
  ),
  child: Card(
    color: Colors.transparent,
    // محتوای card
  ),
)
```

### 3. Bottom Navigation با Gradient:
```dart
Container(
  decoration: BoxDecoration(
    gradient: LinearGradient(
      colors: context.bottomNavigationBarGradientColors,
    ),
  ),
  child: BottomNavigationBar(
    backgroundColor: Colors.transparent,
    // ...
  ),
)
```

### 4. Custom Gradient ها:
```dart
// استفاده از gradient های سفارشی تعریف شده در theme
Container(
  decoration: BoxDecoration(
    gradient: LinearGradient(
      colors: context.getCustomGradientColors('resumeCard'),
    ),
  ),
)
```

## Gradient های موجود در theme شما:

- `resumeCard` - برای کارت‌های رزومه
- `logoWidget` - برای ویجت لوگو
- `actionButton` - برای دکمه‌های اکشن
- `fieldBackground` - برای پس‌زمینه فیلدها
- `heroSection` - برای بخش hero

## تغییر Theme:

```dart
// دریافت controller
final themeController = Get.find<ThemeControllers>();

// تغییر theme
themeController.toggleTheme();
themeController.setLightTheme();
themeController.setDarkTheme();
themeController.setSystemTheme();
```

## مثال کامل:

فایل `lib/widgets/theme_example_widget.dart` را برای مثال کاملی از استفاده از theme_master ببینید.

## نکات مهم:

1. **همیشه ابتدا dependencies را initialize کنید**
2. **از `GetBuilder<ThemeControllers>` استفاده کنید** برای reactive updates
3. **`ThemeMaster` را wrapper اصلی app قرار دهید**
4. **از extension methods استفاده کنید** مثل `context.cardGradientColors`

## خطاهای رایج و راه حل:

### خطا: "ThemeController not found"
**راه حل:** ابتدا `MyBindings().dependencies()` را در main فراخوانی کنید

### خطا: "The getter 'cardGradientColors' isn't defined"
**راه حل:** `import 'package:theme_master/theme_master.dart'` را اضافه کنید

### خطا: Theme تغییر نمی‌کند
**راه حل:** از `GetBuilder<ThemeControllers>` استفاده کنید و `update()` را در controller فراخوانی کنید
