import 'package:flutter/material.dart';
import 'package:theme_master/theme_master.dart';

// Colors from your original theme
const Color lightPrimary = Color(0xFF1D3557);
const Color darkPrimary = Color(0xFF0E4D6A);

const Color resumeCardColorBoeder = Color.fromRGBO(253, 27, 81, 0.2);
const Color resumeCardColorBoederDark = Color.fromRGBO(253, 27, 81, 0.2);

const Color iconColors = Colors.black;
const Color iconColorsDark = Colors.white;

const Color feildBorderColor = Color.fromRGBO(220, 240, 249, 0.4);
const Color feildBorderColorDark = Color.fromRGBO(4, 66, 92, 0.4);

const Color boxColorDark = Color.fromRGBO(1, 16, 26, 1.0);

// Your box shadows
const BoxShadow resumeBoxShadow = BoxShadow(
  color: Color.fromRGBO(8, 14, 28, 0.25),
  spreadRadius: 1,
  blurRadius: 4,
  offset: Offset(0, 1.25),
);

const BoxShadow resumeBoxShadowDark = BoxShadow(
  color: Color.fromRGBO(21, 36, 70, 0.5),
  spreadRadius: 1,
  blurRadius: 4,
  offset: Offset(0, 1.25),
);

const List<Color> infoBoxColorDark = [
  Color.fromRGBO(1, 16, 26, 1.0),
  Color.fromRGBO(1, 16, 26, 1.0),
];
// Your gradient colors
const List<Color> logoWidgetColor = [
  Color.fromRGBO(254, 222, 230, 0.8),
  Color.fromRGBO(220, 240, 249, 0.8),
];

const List<Color> logoWidgetColorDark = [
  Color.fromRGBO(36, 3, 1, 1),
  Color.fromRGBO(1, 22, 30, 1),
];

const List<Color> resumeCardColor = [
  Colors.white,
  Color.fromRGBO(254, 222, 230, 1),
];

const List<Color> backgroundColorsBottomNavigatuonBar = [
  Color.fromRGBO(255, 255, 255, 1),
  Color.fromRGBO(255, 242, 245, 1),
];

const List<Color> backgroundColorsBottomNavigatuonBarDark = [
  Color.fromRGBO(1, 22, 30, 1),
  Color.fromRGBO(36, 3, 1, 1),
];

const List<Color> resumehCardColorDark = [
  Color.fromRGBO(3, 49, 52, 1),
  Color.fromRGBO(36, 3, 1, 1),
];

const List<Color> backgroundColors = [
  Color.fromRGBO(255, 255, 255, 1),
  Color.fromRGBO(255, 242, 245, 1),
];

const List<Color> backgroundColorsDark = [
  Color.fromRGBO(36, 3, 1, 1),
  Color.fromRGBO(1, 22, 30, 1),
];

const List<Color> drawerGradientColorsLight = [
  Color.fromRGBO(255, 255, 255, 1),
  Color.fromRGBO(254, 222, 230, 0.8),
];

const List<Color> drawerGradientColorsDark = [
  Color.fromRGBO(36, 3, 1, 1),
  Color.fromRGBO(1, 22, 30, 1),
];

const List<Color> backgroudColorFeild = [
  Color.fromRGBO(251, 241, 239, 1),
  Color.fromRGBO(252, 248, 248, 1),
  Color.fromRGBO(249, 240, 240, 1),
  Color.fromRGBO(252, 244, 243, 1),
];

const List<Color> backgroudColorFeildDark = [
  Color.fromRGBO(251, 241, 239, 1),
  Color.fromRGBO(252, 248, 248, 1),
  Color.fromRGBO(249, 240, 240, 1),
  Color.fromRGBO(252, 244, 243, 1),
];

// App Theme Colors
class AppThemeColors {
  static const Color colorFF0000 = Color.fromRGBO(0, 0, 0, 1); // Black
  static const Color colorFF0407 = Color.fromRGBO(4, 7, 14, 1); // Dark text
  static const Color colorFF9999 = Color.fromRGBO(153, 153, 153, 1);
  static const Color navColorIcon = Color.fromRGBO(7, 14, 7, 0.5);
  static const Color addFabColor = Color.fromRGBO(30, 51, 99, 1);
  static const Color editeFabColor = Color.fromRGBO(253, 27, 81, 1);
  static const Color titleFieldTextcolor = Color.fromRGBO(7, 14, 7, 1);
}

/// Updated app themes using Theme Master with your color values.
class AppTheme {
  AppTheme._(); // Private constructor to prevent instantiation

  /// Light theme with your custom colors and gradient support.
  static ExtendedThemeData get lightTheme {
    final baseTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'OpenSans',
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: lightPrimary,
        secondary: Color.fromRGBO(253, 27, 81, 1), // editeFabColor
      ),
      scaffoldBackgroundColor: Colors.white,

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: lightPrimary,
        ),
      ),
      cardColor: Colors.white,
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: lightPrimary),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: lightPrimary,
        foregroundColor: Colors.white,
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: const Color.fromRGBO(252, 248, 248, 1),
        filled: true,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: feildBorderColor),
          borderRadius: BorderRadius.circular(10),
        ),
        hintStyle: const TextStyle(color: AppThemeColors.colorFF9999),
        labelStyle: const TextStyle(color: AppThemeColors.colorFF0407),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: lightPrimary),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: feildBorderColor),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.redAccent),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 36.0,
          fontWeight: FontWeight.bold,
          color: AppThemeColors.colorFF0407,
          fontFamily: 'OpenSans',
        ),
        displayMedium: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          color: AppThemeColors.colorFF0407,
          fontFamily: 'OpenSans',
        ),
        bodyLarge: TextStyle(
          fontSize: 16.0,
          color: AppThemeColors.colorFF0407,
          fontFamily: 'OpenSans',
        ),
        bodyMedium: TextStyle(
          fontSize: 14.0,
          color: AppThemeColors.colorFF0407,
          fontFamily: 'OpenSans',
        ),
      ),
    );

    // Create gradient theme data with your colors
    final gradientTheme = ThemeMasterData(
      appBarGradientColors: logoWidgetColor,
      cardGradientColors: resumeCardColor,
      bottomNavigationBarGradientColors: backgroundColorsBottomNavigatuonBar,
      bottomSheetGradientColors: backgroundColors,
      bannerGradientColors: logoWidgetColor,
      badgeGradientColors: const [
        Color.fromRGBO(253, 27, 81, 1),
        Color.fromRGBO(253, 27, 81, 0.8),
      ],
      buttonGradientColors: const [
        lightPrimary,
        Color.fromRGBO(29, 53, 87, 0.8),
      ],
      chipGradientColors: logoWidgetColor,
      choiceChipGradientColors: const [
        lightPrimary,
        Color.fromRGBO(253, 27, 81, 1),
      ],
      scaffoldGradientColors: backgroundColors,
      dialogGradientColors: resumeCardColor,
      dividerGradientColors: const [
        lightPrimary,
        Color.fromRGBO(253, 27, 81, 1),
      ],
      textFieldGradientColors: backgroudColorFeild.take(2).toList(),
      snackBarGradientColors: const [
        lightPrimary,
        Color.fromRGBO(253, 27, 81, 1),
      ],
      tabBarGradientColors: const [
        lightPrimary,
        Color.fromRGBO(29, 53, 87, 0.8),
      ],
      textGradientColors: const [AppThemeColors.colorFF0407, lightPrimary],
      drawerGradientColors: drawerGradientColorsLight,
      customGradients: const {
        'heroSection': [
          Color.fromRGBO(255, 255, 255, 1),
          Color.fromRGBO(255, 242, 245, 1),
          Color.fromRGBO(254, 222, 230, 1),
        ],
        'featureCard': logoWidgetColor,
        'actionButton': [lightPrimary, Color.fromRGBO(253, 27, 81, 1)],
        'resumeCard': resumeCardColor,
        'logoWidget': logoWidgetColor,
        'fieldBackground': backgroudColorFeild,
      },
      borderColors: const {
        // Numbered border slots (BorderColor enum)
        'border1': resumeCardColorBoeder, // Resume card border
        'border2': Color.fromRGBO(220, 240, 249, 0.4), // Skill card border
        'border3': Color.fromRGBO(156, 39, 176, 0.2), // Experience card border
        'border4': Color.fromRGBO(33, 150, 243, 0.2), // Education card border
        'border5': Color.fromRGBO(255, 152, 0, 0.3), // Project card border
        'border6': Color.fromRGBO(233, 30, 99, 0.3), // Personal card border
      },
    );

    return ExtendedThemeData(
      themeData: baseTheme,
      themeMasterData: gradientTheme,
    );
  }

  /// Dark theme with your custom colors and gradient support.
  static ExtendedThemeData get darkTheme {
    final baseTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: 'OpenSans',
      colorScheme: const ColorScheme.dark(
        primary: darkPrimary,
        secondary: Color.fromRGBO(253, 27, 81, 1),
        surface: Color.fromRGBO(36, 3, 1, 1),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: darkPrimary,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: darkPrimary),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: darkPrimary,
        foregroundColor: Colors.white,
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: const Color.fromRGBO(3, 49, 52, 1),
        filled: true,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: feildBorderColorDark),
          borderRadius: BorderRadius.circular(10),
        ),
        hintStyle: const TextStyle(
          color: AppThemeColors.colorFF9999,
        ), // Same hint color for both themes
        labelStyle: const TextStyle(color: Colors.white),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: darkPrimary),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: feildBorderColorDark),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.redAccent),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 36.0,
          fontWeight: FontWeight.bold,
          color: Colors.white, // White text in dark theme
          fontFamily: 'OpenSans',
        ),
        displayMedium: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          color: Colors.white, // White text in dark theme
          fontFamily: 'OpenSans',
        ),
        bodyLarge: TextStyle(
          fontSize: 16.0,
          color: Colors.white, // White text in dark theme
          fontFamily: 'OpenSans',
        ),
        bodyMedium: TextStyle(
          fontSize: 14.0,
          color: Colors.white, // White text in dark theme
          fontFamily: 'OpenSans',
        ),
      ),

      cardColor: boxColorDark,
      dialogTheme: DialogThemeData(
        backgroundColor: const Color.fromRGBO(36, 3, 1, 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    // Create gradient theme data with your dark colors
    final gradientTheme = ThemeMasterData(
      appBarGradientColors: logoWidgetColorDark,
      cardGradientColors: resumehCardColorDark,
      bottomNavigationBarGradientColors:
          backgroundColorsBottomNavigatuonBarDark,
      bottomSheetGradientColors: backgroundColorsDark,
      bannerGradientColors: logoWidgetColorDark,
      badgeGradientColors: const [
        Color.fromRGBO(253, 27, 81, 1),
        Color.fromRGBO(253, 27, 81, 0.8),
      ],
      buttonGradientColors: const [
        darkPrimary,
        Color.fromRGBO(14, 77, 106, 0.8),
      ],
      chipGradientColors: logoWidgetColorDark,
      choiceChipGradientColors: const [
        darkPrimary,
        Color.fromRGBO(253, 27, 81, 1),
      ],
      scaffoldGradientColors: backgroundColorsDark,
      dialogGradientColors: resumehCardColorDark,
      dividerGradientColors: const [
        darkPrimary,
        Color.fromRGBO(253, 27, 81, 1),
      ],
      textFieldGradientColors: backgroudColorFeildDark.take(2).toList(),
      snackBarGradientColors: const [
        darkPrimary,
        Color.fromRGBO(253, 27, 81, 1),
      ],
      tabBarGradientColors: const [
        darkPrimary,
        Color.fromRGBO(14, 77, 106, 0.8),
      ],
      textGradientColors: const [
        Colors.white,
        darkPrimary,
      ], // White to primary for dark theme
      drawerGradientColors: drawerGradientColorsDark,
      borderColors: const {
        // Numbered border slots (BorderColor enum) - Dark Theme
        'border1': resumeCardColorBoederDark, // Resume card border
        'border2': Color.fromRGBO(4, 66, 92, 0.4), // Skill card border
        'border3': Color.fromRGBO(156, 39, 176, 0.3), // Experience card border
        'border4': Color.fromRGBO(33, 150, 243, 0.3), // Education card border
        'border5': Color.fromRGBO(255, 152, 0, 0.4), // Project card border
        'border6': Color.fromRGBO(233, 30, 99, 0.4), // Personal card border
      },
    );

    return ExtendedThemeData(
      themeData: baseTheme,
      themeMasterData: gradientTheme,
    );
  }
}
