import 'package:flutter/material.dart'
    show TextStyle, FontWeight, BuildContext, ThemeData, CardThemeData, AppBarTheme, Color, OutlinedBorder, BorderSide, TextTheme, EdgeInsets, BorderRadius, Radius, RoundedRectangleBorder, kToolbarHeight, WidgetStateProperty, WidgetState, Theme, Colors, ButtonStyle, ElevatedButtonThemeData, TextButtonThemeData, IconThemeData, VisualDensity, ButtonThemeData, ButtonTextTheme, TextDecoration, InputDecorationTheme, OutlineInputBorder, ListTileThemeData, RadioThemeData, MaterialStatePropertyAll, WidgetStatePropertyAll, DatePickerThemeData;
import 'common/utils/utils.dart' show Responsive;
import 'core/constants.dart';

class CustomTheme {
  static const graphikSemiBold = TextStyle(
    fontFamily: 'Graphik',
    fontWeight: FontWeight.w600,
  );

  static ThemeData lightThemeData(BuildContext context) {
    return ThemeData(
      fontFamily: 'Graphik',
      cardTheme: const CardThemeData(
        margin: EdgeInsets.all(10),
        color: CustomColours.white,
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
      scaffoldBackgroundColor: CustomColours.beige,
      useMaterial3: true,
      colorSchemeSeed: CustomColours.greenish,
      textTheme: createTextTheme(context),
      appBarTheme: AppBarTheme(
        toolbarHeight: kToolbarHeight * 1.25,
        backgroundColor: CustomColours.beige,
        centerTitle: true,
        iconTheme: IconThemeData(
          size: Responsive.responsive(context, xs: 24, lg: 32),
        ),
        titleTextStyle: TextStyle(
          fontFamily: 'Graphik',
          color: CustomColours.black,
          fontSize: Responsive.responsive(context, xs: 18, lg: 32),
          fontWeight: FontWeight.w600,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all<Color>(CustomColours.black),
          textStyle: WidgetStateProperty.all<TextStyle>(
            Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          shadowColor:
              WidgetStateProperty.all<Color>(Colors.black.withAlpha(90)),
          shape: WidgetStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          backgroundColor: WidgetStateProperty.resolveWith<Color>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return CustomColours.greenish
                    .withValues(alpha: 0.5); // Disabled color
              }
              return CustomColours.greenish; // Enabled color
            },
          ),
        ),
      ),
      listTileTheme: ListTileThemeData(
        iconColor: CustomColours.black,
        textColor: CustomColours.black,
        selectedTileColor: CustomColours.greenish.withValues(alpha: 0.2),
        selectedColor: CustomColours.white,
        enableFeedback: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: WidgetStateProperty.all<TextStyle>(
            Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          foregroundColor: WidgetStateProperty.all<Color>(CustomColours.shark),
          shape: WidgetStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              side: const BorderSide(color: CustomColours.black),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }

  static const Color primaryBlue = Color(0xFF2196F3);
  static const Color backgroundDark = Color(0xFF182D42);
  static const Color textWhite = Color(0xFFFFFFFF);
  static const Color textGray = Color(0xFF9E9E9E);
  static const Color buttonGray = Color(0xFFE0E0E0);
  static const Color textDark = Color(0xFF424242);
  static const Color accentBlue = Color(0xFF2196F3);
  static const Color successGreen = Color(0xFF4CAF50);
  static const Color warningOrange = Color(0xFFFF9800);
  static const Color errorRed = Color(0xFFF44336);
  static const Color lightBlue = Color(0xFF43A2D9);

  static ThemeData darkThemeData(BuildContext context) {
    final theme = lightThemeData(context);
    return theme.copyWith(
      appBarTheme: const AppBarTheme(
        backgroundColor: backgroundDark,
        titleTextStyle: TextStyle(
          fontFamily: 'Graphik',
          color: textWhite,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: IconThemeData(color: textWhite),
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: backgroundDark,
      textTheme: createTextTheme(context).copyWith(
        headlineLarge: createTextTheme(context)
            .headlineLarge!
            .copyWith(color: textWhite, fontSize: 23),
        bodyLarge: createTextTheme(context).bodyLarge!.copyWith(
              color: buttonGray,
              fontSize: 16,
            ),
        titleSmall: createTextTheme(context).titleSmall!.copyWith(
              fontSize: 16,
            ),
      ),
      listTileTheme: ListTileThemeData(
        iconColor: textWhite,
        // textColor: textWhite,
        selectedTileColor: lightBlue.withValues(alpha: 0.2),
        selectedColor: lightBlue,
        enableFeedback: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: textGray),
        ),
        titleTextStyle: const TextStyle(
          color: CustomColours.black,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      radioTheme: const RadioThemeData(
        fillColor: WidgetStatePropertyAll<Color>(textDark),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          elevation: WidgetStateProperty.all<double>(1),
          enableFeedback: true,
          foregroundColor: WidgetStateProperty.all<Color>(textWhite),
          textStyle: WidgetStateProperty.all<TextStyle>(
            Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          shadowColor: WidgetStateProperty.all<Color>(Colors.black.withAlpha(90)),
          shape: WidgetStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          backgroundColor: WidgetStateProperty.resolveWith<Color>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return lightBlue.withValues(alpha: 0.5); // Disabled color
              }
              return lightBlue; // Enabled color
            },
          ),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CustomColours.darkBlue, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CustomColours.darkBlue, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CustomColours.red, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CustomColours.red, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
      datePickerTheme: const DatePickerThemeData(
        rangePickerElevation: 10,
        confirmButtonStyle: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll<Color>(CustomColours.white),
          backgroundColor: WidgetStatePropertyAll<Color>(CustomColours.darkBlue),
        ),
        cancelButtonStyle: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll<Color>(CustomColours.white),
          backgroundColor: WidgetStatePropertyAll<Color>(CustomColours.red),
        ),
        rangePickerBackgroundColor: CustomColours.white,
        dayStyle: TextStyle(
          color: CustomColours.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        headerBackgroundColor: CustomColours.darkBlue,
        headerForegroundColor: CustomColours.white,
      ),
    );
  }
}

TextTheme createTextTheme(BuildContext context) {
  TextTheme baseTextTheme = Theme.of(context).textTheme;
  TextTheme textTheme = baseTextTheme.copyWith(
    titleSmall: baseTextTheme.titleSmall!
        .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
    titleMedium: baseTextTheme.titleMedium!
        .copyWith(fontWeight: FontWeight.bold, fontSize: 18),
    titleLarge: baseTextTheme.titleMedium!
        .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
    headlineLarge: baseTextTheme.headlineLarge!
        .copyWith(fontWeight: FontWeight.bold, fontSize: 32),
    displaySmall: baseTextTheme.displaySmall!
        .copyWith(fontWeight: FontWeight.bold, fontSize: 32),
    displayLarge: baseTextTheme.displayLarge!
        .copyWith(fontWeight: FontWeight.bold, fontSize: 54),
    displayMedium: baseTextTheme.displayMedium!
        .copyWith(fontWeight: FontWeight.bold, fontSize: 48),
    bodyLarge: baseTextTheme.bodyLarge!.copyWith(
      fontSize: 18,
      letterSpacing: 0,
      fontWeight: FontWeight.w500,
    ),
    // bodyMedium: bodyTextTheme.bodyMedium,
    bodySmall: baseTextTheme.bodySmall!.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
    // labelLarge: bodyTextTheme.labelLarge,
    // labelMedium: bodyTextTheme.labelMedium,
    labelSmall: baseTextTheme.labelSmall!.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
  );
  return textTheme;
}
