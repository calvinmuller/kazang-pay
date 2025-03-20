import 'package:flutter/material.dart'
    show StatelessWidget, BuildContext, Widget, MediaQuery, LayoutBuilder, SizedBox, Size;

class KeyboardPadding extends StatelessWidget {
  const KeyboardPadding({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox.fromSize(
          size: Size.fromHeight(
            MediaQuery.of(context).viewInsets.bottom,
          ),
        );
      },
    );
  }
}
