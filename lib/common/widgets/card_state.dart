import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardState extends StatelessWidget {
  const CardState({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/insert_card.svg',
      height: 140,
    );
  }
}
