import 'package:flutter/material.dart'
    show
        EdgeInsets,
        ValueChanged,
        BuildContext,
        Widget,
        Colors,
        BorderRadius,
        BorderSide,
        RoundedRectangleBorder,
        BoxDecoration,
        Container,
        Theme,
        Text,
        Radio,
        ListTile,
        Material,
        Padding;
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerWidget, WidgetRef;
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constants.dart';

class AccountItem extends ConsumerWidget {
  const AccountItem({
    super.key,
    required this.account,
    required this.groupValue,
    required this.onChanged,
    required this.index,
    this.padding,
    this.dense = false,
    this.showLeading = true,
  });

  final String account;
  final int index;
  final EdgeInsets? padding;
  final Map groupValue;
  final ValueChanged<String> onChanged;
  final bool dense;
  final bool showLeading;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isActive = index == groupValue['index'];
    return Padding(
      padding: padding ?? const EdgeInsets.all(0),
      child: Material(
        child: ListTile(
          dense: dense,
          tileColor: Colors.white,
          contentPadding:
              EdgeInsets.symmetric(vertical: (dense) ? 0 : 10, horizontal: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: isActive || dense ? Colors.transparent : CustomColours.black,
            ),
          ),
          selected: isActive,
          selectedTileColor: CustomColours.lightYellow,
          onTap: () {
            if (!isActive) {
              onChanged(account);
            }
          },
          leading: showLeading
              ? Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: CustomColours.darkBlue,
                  ),
                  child: SvgPicture.asset(
                    (account.toLowerCase().contains("visa")
                        ? 'assets/visa.svg'
                        : 'assets/visa.svg'),
                    width: 32,
                  ),
                )
              : null,
          title: Text(account, style: Theme.of(context).textTheme.titleSmall),
          trailing: Radio<String>(
            groupValue: groupValue['index'].toString(),
            value: index.toString(),
            onChanged: (String? newValue) {
              onChanged(newValue!);
            },
          ),
        ),
      ),
    );
  }
}
