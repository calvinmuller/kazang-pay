import 'package:flutter/material.dart';
import 'dart:async';

import 'package:connectivity/connectivity.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }
  bool _connected = false;

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    Connectivity.onConnectivityChanged.listen((connected) {
      setState(() {
        _connected = connected;
      });
      print("Connected: $connected");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Connected: $_connected'),
        ),
      ),
    );
  }
}
