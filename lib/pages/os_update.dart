import 'package:flutter/material.dart'
    show BuildContext, Scaffold, Widget, Text, Center, AppBar;
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OsUpdate extends ConsumerStatefulWidget {
  const OsUpdate({super.key});

  @override
  ConsumerState<OsUpdate> createState() => _OsUpdateState();
}

class _OsUpdateState extends ConsumerState<OsUpdate> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('OS Update'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('OS Update Page'),
      ),
    );
  }
}
