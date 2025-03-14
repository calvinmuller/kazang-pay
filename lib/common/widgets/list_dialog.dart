import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show
        BorderRadius,
        BuildContext,
        Colors,
        Column,
        CrossAxisAlignment,
        Dialog,
        EdgeInsets,
        ListTile,
        Padding,
        Radio,
        RoundedRectangleBorder,
        State,
        StatefulWidget,
        Text,
        TextAlign,
        Theme,
        Widget;

import '../../core/core.dart';
import '../../l10n/app_localizations.dart';
import 'widgets.dart' show Button;

class ListDialog extends StatefulWidget {
  const ListDialog({super.key, required this.items, this.mainContext});

  final List<dynamic> items;
  final BuildContext? mainContext;

  @override
  State<ListDialog> createState() => _ListDialogState();
}

class _ListDialogState extends State<ListDialog> {
  Map selectedAccount = {};

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: borderRadiusSmall,
      ),
      backgroundColor: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              textAlign: TextAlign.center,
              l10n.selectAccount,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: widget.items.mapIndexed((item, i) {
              final isActive = selectedAccount['index'] == i;

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListTile(
                  dense: true,
                  tileColor: Colors.white,
                  selectedTileColor: CustomColours.lightYellow,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 5,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  selected: isActive,
                  onTap: () {
                    if (item != selectedAccount) {
                      setState(() {
                        selectedAccount = {'index': i, 'value': item};
                      });
                    }
                  },
                  leading: Radio<num>(
                    groupValue: selectedAccount['index'],
                    value: i,
                    onChanged: (newValue) {
                      setState(() {
                        selectedAccount = {'index': i, 'value': newValue};
                      });
                    },
                  ),
                  title: Text(
                    item.toString(),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              );
            }).toList(),
          ),
          Button(
            elevation: 0,
            margin: const EdgeInsets.all(16),
            onPressed: selectedAccount != {}
                ? () {
              Navigator.pop(context, selectedAccount);
              // context.pop(selectedAccount);
            } : null,
            child: Text(l10n.continueButton),
          ),
        ],
      ),
    );
  }
}
