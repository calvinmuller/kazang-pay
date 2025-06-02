import 'package:flutter/material.dart';
import 'dart:async';
import 'package:tcp_receiver/tcp_receiver.dart';
import 'package:tcp_receiver/tcp_client_server.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _tcpReceiverPlugin = TcpReceiver();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    final server = TcpClientServer(
    onTransactionReceived: (transaction) {
      print('Transaction received: $transaction');
    },
  );

  server.start();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Server'),
        ),
      ),
    );
  }
}
