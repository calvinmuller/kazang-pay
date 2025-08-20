import 'package:flutter/material.dart'
    show
        LinearGradient,
        Color,
        BorderRadius,
        Radius,
        Offset,
        BoxShadow,
        BoxDecoration,
        NavigatorState,
        GlobalKey;

final headerGradient = LinearGradient(
  colors: <Color>[
    CustomColours.prismBlue.withOpacity(0.8),
    CustomColours.prismBlue.withOpacity(0.6),
  ],
  // These are normalized stops; 123.39% is beyond 1.0
);

const homeDecoration = BoxDecoration(
  borderRadius: borderRadius,
);

const borderGradient = {
  'error': [
    Color(0XFFE12727),
    Color(0XFFFF9A14),
    Color(0XFFE12727),
    Color(0XFFFF9A14),
  ],
  'success': [
    Color(0xFF2E86C1), // Rich blue
    Color(0xFF48C9B0), // Complementary teal
    Color(0xFF2E86C1), // Rich blue
    Color(0xFF48C9B0), // Complementary teal
  ]
};

const borderRadius = BorderRadius.only(
  bottomLeft: Radius.circular(20),
  bottomRight: Radius.circular(20),
);

const borderRadiusSmall = BorderRadius.all(
  Radius.circular(10),
);

class CustomColours {
  static const black = Color(0xFF040000);
  static const white = Color(0xFFF9FBFD);
  static const prismNavy = Color(0xFF2C3E50);
  static const prismBlue = Color(0xFF3498DB);
  static const greenish = Color(0xFF3498DB);
  static const green = Color(0xFF24AA4A);
  static const lightYellow = Color(0xFFDCE272);
  static const yellow = Color(0xFFFFCD1C);
  static const theOtherYellow = Color(0xFFFFE280);
  static const orange = Color(0xFFFFC046);
  static const beige = Color(0xFFF2F3D6);
  static const shark = Color(0xFF1B1B1D);
  static const clay = Color(0xFFFFB34B);
  static const purple = Color(0xFF460069);
  static const red = Color(0xFFE12727);
  static const lime = Color(0xFFF0F2C2);
  static const grayscale = Color(0xFFE8E8E7);
  static const darkBlue = Color(0xFF2C3E50);
  static const grey = Color(0xFF7b7b7b);
  static const lightGray = Color(0xFFF7F7F5);
  static const gold = Color(0xFFFF9A14);
  static const softButter = Color(0xFFFFEDB2);
  static const primaryNeutral = Color(0xFFE2F4FB);
}

const shadow = [
  BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.09),
    offset: Offset(0, 1),
    blurRadius: 6,
    spreadRadius: 2,
  ),
];

const panelDecoration = BoxDecoration(
  color: CustomColours.white,
  borderRadius: borderRadiusSmall,
  boxShadow: shadow,
);

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

const handledErrors = ["TRY_AGAIN_RESENT_CARD"];
