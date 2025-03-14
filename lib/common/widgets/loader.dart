import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';

class Loader extends StatelessWidget {
  const Loader({super.key, this.message});

  final String? message;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 32),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Material(
          color: Colors.white,
          child: Row(
            spacing: 20,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox.square(
                dimension: 25,
                child: CircularProgressIndicator(strokeWidth: 1.5),
              ),
              Text((message != null) ? message!: l10n.loading, style: Theme.of(context).textTheme.titleSmall),
            ],
          ),
        ),
      ),
    );
  }
}