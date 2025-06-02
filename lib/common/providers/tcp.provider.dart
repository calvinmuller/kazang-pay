import 'package:flutter_riverpod/flutter_riverpod.dart' show Provider;
import 'package:go_router/go_router.dart';
import 'package:tcp_receiver/tcp_client_server.dart' show TcpClientServer;
import 'package:tcp_receiver/transaction.dart' show TcpTransaction;
import '../../core/constants.dart' show navigatorKey;
import 'payment.provider.dart';

final tcpServerProvider = Provider<TcpClientServer>((ref) {
  final server = TcpClientServer(
    onTransactionReceived: (msg) {
      print('Transaction received via provider: $msg');
      final paymentNotifier = ref.read(paymentNotifierProvider.notifier);
      final transaction = TcpTransaction.fromString(msg);
      paymentNotifier.setFromTcpTransaction(transaction);
      navigatorKey.currentContext!.goNamed('payment');
    },
  );

  ref.onDispose(() {
    server.stop();
  });

  return server;
});
