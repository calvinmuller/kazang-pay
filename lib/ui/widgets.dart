import 'package:flutter/material.dart' show StatelessWidget, AnimationController, BuildContext, Widget, EdgeInsets, BoxFit, Padding;
import 'package:flutter_svg/flutter_svg.dart' show SvgPicture;
import 'package:lottie/lottie.dart' show Lottie, LottieComposition;

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key, this.width = 250});

  final double width;

  @override
  Widget build(BuildContext context) {
    const assetName = 'assets/logo-app.svg';
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SvgPicture.asset(
        width: width,
        assetName,
        semanticsLabel: 'KazangPay Logo',
        fit: BoxFit.scaleDown,
      ),
    );
  }
}

class LottieWidget extends StatelessWidget {
  const LottieWidget({super.key, required this.assetName, this.controller, this.size = 200, this.repeat = false, this.width = 200, this.animate=true});

  final String assetName;
  final double? size;
  final double width;
  final bool repeat;
  final AnimationController? controller;
  final bool animate;

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      animate: animate,
      width: width,
      height: size,
      fit: BoxFit.contain,
      controller: controller,
      repeat: repeat,
      assetName,
      decoder: customDecoder,
      onLoaded: (composition) {
        if (controller != null && animate) {
          final duration = composition.duration;
          controller!
            ..duration = duration
            ..reset()
            ..forward();
        }
      },
    );
  }

  Future<LottieComposition?> customDecoder(List<int> bytes) {
    return LottieComposition.decodeZip(bytes, filePicker: (files) {
      return files.last;
    });
  }
}
