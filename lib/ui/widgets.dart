import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show
        StatelessWidget,
        AnimationController,
        BuildContext,
        Widget,
        EdgeInsets,
        BoxFit,
        Padding,
        FractionallySizedBox,
        MediaQuery,
        SizedBox;
import 'package:flutter/services.dart' show KeyDownEvent, LogicalKeyboardKey;
import 'package:flutter_svg/flutter_svg.dart' show SvgPicture;
import 'package:lottie/lottie.dart' show Lottie, LottieComposition;

import '../common/providers/device_info.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key, this.widthFactor});

  final double? widthFactor;

  @override
  Widget build(BuildContext context) {
    const assetName = 'assets/logo-app.svg';
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: FractionallySizedBox(
        widthFactor: widthFactor,
        child: SvgPicture.asset(
          assetName,
          semanticsLabel: 'KazangPay Logo',
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}

class LottieWidget extends StatelessWidget {
  const LottieWidget(
      {super.key,
      required this.assetName,
      this.controller,
      this.size = 200,
      this.repeat = false,
      this.width = 200,
      this.animate = true});

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

// HiddenOnMobile is a widget that can be used to hide content on i5300
class HiddenOnMobile extends StatelessWidget {
  const HiddenOnMobile(
      {super.key, required this.child, this.alternate = const SizedBox()});

  final Widget child;
  final Widget alternate;

  @override
  Widget build(BuildContext context) {
    final isMobile =
        MediaQuery.of(context).size.width < 350; // Example breakpoint
    return isMobile ? alternate : child;
  }
}

/// The i5300 has a hardware enter key that can be used to pop the current route.
class PopOnEnter extends StatelessWidget {
  const PopOnEnter(
      {super.key, required this.child, this.onEnterPressed, this.focusNode});

  final Widget child;
  final Function? onEnterPressed;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    final isi5300 = DeviceInfoProvider.of(context)!.isi5300;

    return KeyboardListener(
      autofocus: true,
      focusNode: focusNode ?? FocusNode(),
      onKeyEvent: (KeyEvent event) {
        debugPrint('Home Key event: $event');
        if (event is KeyDownEvent &&
            event.logicalKey == LogicalKeyboardKey.enter &&
            isi5300) {
          onEnterPressed != null
              ? onEnterPressed!()
              : Navigator.popUntil(context, (route) => route.isFirst);
        }
      },
      child: child,
    );
  }
}

// I need a responsive widget that shows a column or row depends on the isi5300 on deviceInfoProvider
class ResponsiveFlex extends StatelessWidget {
  const ResponsiveFlex({super.key, required this.children, this.spacing = 12});

  final List<Widget> children;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    final isi5300 = DeviceInfoProvider.of(context)!.isi5300;
    return !isi5300
        ? Row(
            spacing: spacing,
            children: children,
          )
        : Column(
            spacing: spacing,
            mainAxisSize: MainAxisSize.min,
            children: children,
          );
  }
}
