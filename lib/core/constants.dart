import 'package:flutter/material.dart'
    show LinearGradient, Color, Alignment, BorderRadius, Radius, Colors, Offset, BoxShadow, BoxDecoration, NavigatorState, GlobalKey, Border;

const headerGradient = LinearGradient(
  colors: <Color>[
    CustomColours.greenish,
    CustomColours.yellow,
  ],
  begin: Alignment.topLeft,
  end: Alignment.center,
);

final homeDecoration = BoxDecoration(
  border: Border.all(
    color: Colors.white,
    width: 1.5,
  ),
  borderRadius: const BorderRadius.only(
    topLeft: Radius.circular(25),
    bottomRight: Radius.circular(25),
  ),
);

const borderGradient = {
  'error': [
    Color(0XFFE12727),
    Color(0XFFFF9A14),
    Color(0XFFE12727),
    Color(0XFFFF9A14),
  ],
  'success': [
    Color(0XFF24AA4A),
    Color(0XFFBEC430),
    Color(0XFF24AA4A),
    Color(0XFFBEC430),
  ]
};

const borderRadius = BorderRadius.all(
  Radius.circular(20),
);

const borderRadiusSmall = BorderRadius.all(
  Radius.circular(10),
);

class CustomColours {
  static const black = Color(0xFF040000);
  static const white = Color(0xFFF9FBFD);
  static const greenish = Color(0xFFBEC430);
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
  static const darkBlue = Color(0xFF1A1F71);
  static const grey = Color(0xFFC6C6C5);
  static const lightGray = Color(0xFFF7F7F5);
  static const gold = Color(0xFFFF9A14);
  static const softButter = Color(0xFFFFEDB2);
}

const shadow = [
  BoxShadow(
    color: Colors.black12,
    blurRadius: 3,
    spreadRadius: 1,
    offset: Offset(0, 0.5),
  )
];

const panelDecoration = BoxDecoration(
  color: CustomColours.white,
  borderRadius: borderRadiusSmall,
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 3,
      spreadRadius: 1,
      offset: Offset(0, 1),
    )
  ],
);

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

const handledErrors = ["TRY_AGAIN_RESENT_CARD"];