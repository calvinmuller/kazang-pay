import 'package:flutter/material.dart' show StatelessWidget, BuildContext, Widget, EdgeInsets, SizedBox, Colors, BorderRadius, BoxDecoration, MainAxisSize, CircularProgressIndicator, Theme, Text, Row, Container, Center, AlwaysStoppedAnimation, Color;
import '../../l10n/app_localizations.dart';
import '../../core/constants.dart';

class Loader extends StatelessWidget {
  const Loader({super.key, this.message, this.transparent = false, this.padding = const EdgeInsets.symmetric(vertical: 25, horizontal: 32), this.showLoader = true});

  final String? message;
  final bool transparent;
  final bool showLoader;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Center(
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: (transparent) ? null: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          spacing: 20,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showLoader)
              SizedBox.square(
                dimension: 25,
                child: CircularProgressIndicator(
                  strokeWidth: 1.5,
                  valueColor: transparent 
                    ? const AlwaysStoppedAnimation<Color>(CustomColours.white)
                    : null,
                ),
              ),
            Text((message != null) ? message!: l10n.loading, style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: transparent ? CustomColours.white : null,
            )),
          ],
        ),
      ),
    );
  }
}