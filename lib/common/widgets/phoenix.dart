
import 'package:flutter/material.dart' show StatefulWidget, Widget, Key, BuildContext, State, UniqueKey, KeyedSubtree;

class Phoenix extends StatefulWidget {
  final Widget child;

  const Phoenix({super.key, required this.child});

  static rebirth(BuildContext context) {
    context.findAncestorStateOfType<_PhoenixState>()!.restartApp();
  }

  @override
  State<StatefulWidget> createState() => _PhoenixState();
}

class _PhoenixState extends State<Phoenix> {
  Key _key = UniqueKey();

  void restartApp() {
    setState(() {
      _key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: _key,
      child: widget.child,
    );
  }
}