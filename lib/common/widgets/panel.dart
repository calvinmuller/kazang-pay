import 'package:flutter/material.dart';

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
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.09),
                      blurRadius: 6,
                      spreadRadius: 2,
                    ),
                  ],
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
