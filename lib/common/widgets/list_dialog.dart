import 'package:flutter/material.dart'
    show BorderRadius, BuildContext, Colors, Column, CrossAxisAlignment, EdgeInsets, ListTile, Padding, Radio, RoundedRectangleBorder, State, StatefulWidget, Text, TextAlign, Theme, Widget, MainAxisSize, Card, Expanded, ListView, FractionallySizedBox, Radius, BorderSide, BoxDecoration, Container;
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../core/core.dart';
import '../../l10n/app_localizations.dart';
import '../utils/utils.dart' show Responsive;
import 'widgets.dart' show Button;

class ListDialog extends StatefulWidget {
  const ListDialog({
    super.key,
    required this.items,
    this.mainContext,
    this.title,
    this.inverted = false,
  });

  final List<dynamic> items;
  final BuildContext? mainContext;
  final String? title;
  final bool inverted;

  @override
  State<ListDialog> createState() => _ListDialogState();
}

class _ListDialogState extends State<ListDialog> {
  Map selectedAccount = {};

  leadingWidget(int i) => Radio<int>(
        groupValue: selectedAccount['index'],
        value: i,
        enabled: false,
      );

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return FractionallySizedBox(
      widthFactor: Responsive.isLgUp(context) ? 0.5 : null,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        color: Colors.white,
        elevation: 0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      textAlign: TextAlign.center,
                      widget.title ?? l10n.selectAccount,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  ...widget.items.mapIndexed((item, i) {
                    final isActive = selectedAccount['index'] == i;
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: ListTile(
                        dense: true,
                        tileColor: Colors.white,
                        selectedTileColor: CustomColours.lightYellow,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            color: isActive
                                ? Colors.transparent
                                : CustomColours.black,
                          ),
                        ),
                        selected: isActive,
                        onTap: () {
                          if (item != selectedAccount) {
                            setState(() {
                              selectedAccount = {'index': i, 'value': item};
                            });
                          }
                        },
                        trailing: widget.inverted ? leadingWidget(i) : null,
                        leading: widget.inverted
                            ? Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: CustomColours.darkBlue,
                                ),
                                child: SvgPicture.asset(
                                  (item.toLowerCase().contains("visa")
                                      ? 'assets/visa.svg'
                                      : 'assets/visa.svg'),
                                  width: 32,
                                ),
                              )
                            : leadingWidget(i),
                        title: Text(
                          item.toString(),
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                    );
                  })
                ],
              ),
            ),
            Button.main(
              height: 64,
              margin: const EdgeInsets.all(16),
              onPressed: selectedAccount.isNotEmpty
                  ? () => context.pop(selectedAccount)
                  : null,
              child: Text(l10n.continueButton),
            ),
          ],
        ),
      ),
    );
  }
}
