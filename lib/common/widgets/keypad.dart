import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../theme.dart';
import '../providers/payment.provider.dart';

import '../../core/constants.dart';

class KeyPad extends ConsumerWidget {
  const KeyPad({super.key});

  final double spacing = 10;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(paymentNotifierProvider.notifier);
    final numberPressed = notifier.numberPressed;
    final clear = notifier.clear;
    final clearAll = notifier.clearAll;

    return Column(
      spacing: spacing,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: Row(
            spacing: spacing,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _getButton(text: '1', onTap: () => numberPressed(1)),
              _getButton(text: '2', onTap: () => numberPressed(2)),
              _getButton(text: '3', onTap: () => numberPressed(3)),
            ],
          ),
        ),
        Expanded(
          child: Row(
            spacing: spacing,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _getButton(text: '4', onTap: () => numberPressed(4)),
              _getButton(text: '5', onTap: () => numberPressed(5)),
              _getButton(text: '6', onTap: () => numberPressed(6)),
            ],
          ),
        ),
        Expanded(
          child: Row(
            spacing: spacing,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _getButton(text: '7', onTap: () => numberPressed(7)),
              _getButton(text: '8', onTap: () => numberPressed(8)),
              _getButton(text: '9', onTap: () => numberPressed(9)),
            ],
          ),
        ),
        Expanded(
          child: Row(
            spacing: spacing,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _getButton(
                text: '00',
                onTap: () => numberPressed('00'),
              ),
              _getButton(
                text: '0',
                // onLongPress: clearCart,
                onTap: () => numberPressed(0),
              ),
              _getButton(
                icon: const Icon(
                  Icons.chevron_left,
                  size: 36,
                  color: CustomColours.shark,
                ),
                onTap: clear,
                backgroundColor: CustomColours.clay,
                onLongPress: clearAll,
                border: false,
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _getButton({
    String? text,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    Color? backgroundColor,
    Color? textColor = CustomColours.shark,
    double fontSize = 22,
    Widget? icon,
    bool? border = true,
  }) {
    return Expanded(
      child: CalculatorButton(
        label: text,
        icon: icon,
        onTap: onTap,
        onLongPress: onLongPress,
        backgroundColor: backgroundColor,
        labelColor: textColor,
        fontSize: fontSize,
        border: border,
      ),
    );
  }

  operatorPressed(String s) {}

  void clear() {}
}

class CalculatorButton extends StatelessWidget {
  const CalculatorButton({
    super.key,
    @required this.label,
    @required this.onTap,
    this.onLongPress,
    this.backgroundColor,
    this.fontSize = 20,
    this.labelColor = CustomColours.shark,
    this.icon,
    this.border,
  });

  final String? label;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final Color? backgroundColor;
  final Color? labelColor;
  final double fontSize;
  final bool? border;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTapDown: (details) {
        Feedback.forTap(context);
        onTap!();
      },
      onLongPress: onLongPress,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: border! ? CustomColours.shark : Colors.transparent,
            width: 1,
          ),
        ),
        alignment: Alignment.center,
        child: (label != null)
            ? Text(label!, style: CustomTheme.graphikSemiBold.copyWith(fontSize: fontSize))
            : icon!,
      ),
    );
  }
}
