import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart' show debugPrint;
import 'package:tcp_receiver/tcp_receiver.dart';

const String stopIndicator = 'SS|';
const String pingRequest = 'PING';
const String pingResponse = 'TRUE|SS|';

class TcpClientServer {
  ServerSocket? _serverSocket;
  Socket? _clientSocket;
  TcpReceiver tcpReceiver = TcpReceiver();

  final Function(String) onTransactionReceived;
  bool _waitingForResponse = false;

  TcpClientServer({required this.onTransactionReceived, bool enabled = true});

  Future<void> start() async {
    final config = await tcpReceiver.loadConfig();
    debugPrint("tcpReceiver Port: ${config.port}, Enabled: ${config.enabled}");

    if (!config.enabled || _serverSocket != null) return;

    _serverSocket = await ServerSocket.bind(
      InternetAddress.anyIPv4,
      config.port,
    );
    _serverSocket!.listen(_handleConnection);
  }

  void _handleConnection(Socket client) {
    _clientSocket = client;
    final buffer = StringBuffer();

    client.listen(
      (data) {
        final chunk = utf8.decode(data);
        buffer.write(chunk);

        if (chunk.contains(stopIndicator)) {
          final message = buffer.toString();
          if (message.contains(pingRequest) || message.trim().isEmpty) {
            respond(pingResponse);
          } else {
            _waitingForResponse = true;

            try {
              onTransactionReceived(message);
            } catch (e) {
              print('Error parsing: $e');
            }
          }
        }
      },
      onDone: () {
        _cleanup("onDone");
      },
      onError: (e) {
        _cleanup("onError");
      },
    );
  }

  void respond(String message) async {
    if (_clientSocket != null && _waitingForResponse) {
      try {
        _clientSocket!.write(message);
        await _clientSocket!.flush();
        await _clientSocket!.close();
        _waitingForResponse = false;
      } catch (e) {
        print('Error sending response: $e');
      }
    }
  }

  Future<void> complete(String transactionResponse) async {
    respond(transactionResponse);
  }

  Future<void> stop() async {
    print('TCP Client/Server stop');
    await _clientSocket?.close();
    await _serverSocket?.close();
    _cleanup("stop");
  }

  void _cleanup(String? method) {
    print('TCP Client/Server cleanup ${method}');
    _clientSocket = null;
    _waitingForResponse = false;
  }
}
