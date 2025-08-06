import 'package:flutter/material.dart' show StatelessWidget, Widget, BuildContext, EdgeInsets, BorderRadius, CrossAxisAlignment, Colors, Radius, BoxDecoration, Container, Expanded, Column, SafeArea;

import '../../core/constants.dart' show shadow;

class Panel extends StatelessWidget {
  const Panel({super.key, required this.child, this.footer});

  final Widget child;
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: shadow,
                  borderRadius: (footer == null)
                      ? const BorderRadius.all(Radius.circular(10))
                      : const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                  color: Colors.white,
                ),
                child: child,
              ),
            ),
            if (footer != null) footer!,
          ],
        ),
      ),
    );
  }
}
