import 'package:flutter/material.dart'
    show
        TextStyle,
        FontWeight,
        BuildContext,
        ThemeData,
        CardThemeData,
        AppBarTheme,
        Color,
        OutlinedBorder,
        BorderSide,
        TextTheme,
        EdgeInsets,
        BorderRadius,
        Radius,
        RoundedRectangleBorder,
        kToolbarHeight,
        WidgetStateProperty,
        Theme,
        Colors,
        ButtonStyle,
        ElevatedButtonThemeData,
        TextButtonThemeData;
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
      appBarTheme: const AppBarTheme(
        toolbarHeight: kToolbarHeight * 1.25,
        backgroundColor: CustomColours.beige,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontFamily: 'Graphik',
          color: CustomColours.black,
          fontSize: 18,
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
          backgroundColor:
              WidgetStateProperty.all<Color>(CustomColours.greenish),
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

  static ThemeData darkThemeData() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: Colors.yellow,
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
    headlineLarge:
        baseTextTheme.headlineLarge!.copyWith(fontWeight: FontWeight.bold, fontSize: 32),
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
