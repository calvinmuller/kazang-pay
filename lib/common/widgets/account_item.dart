

import 'package:flutter/material.dart' show EdgeInsets, ValueChanged, BuildContext, Widget, Colors, BorderRadius, BorderSide, RoundedRectangleBorder, BoxDecoration, Container, Theme, Text, Radio, ListTile, Material, Padding;
import 'package:flutter_riverpod/flutter_riverpod.dart' show ConsumerWidget, WidgetRef;
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
  });

  final String account;
  final int index;
  final EdgeInsets? padding;
  final Map groupValue;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isActive = index == groupValue['index'];
    return Padding(
      padding: padding ?? const EdgeInsets.all(0),
      child: Material(
        child: ListTile(
          tileColor: Colors.white,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
                color: isActive
                    ? Colors.transparent
                    : CustomColours.black),
          ),
          selected: isActive,
          selectedTileColor: CustomColours.lightYellow,
          onTap: () {
            if (!isActive) {
              onChanged(account);
            }
          },
          leading: Container(
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
          ),
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
