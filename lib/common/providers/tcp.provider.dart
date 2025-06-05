import 'package:flutter_riverpod/flutter_riverpod.dart' show Provider;
import 'package:go_router/go_router.dart';
import 'package:tcp_receiver/tcp_client_server.dart' show TcpClientServer;
import '../../core/constants.dart' show navigatorKey;
import '../../helpers/transaction_helper.dart';
import 'payment.provider.dart';

final tcpServerProvider = Provider<TcpClientServer>((ref) {
  final server = TcpClientServer(
    onTransactionReceived: (transaction) {
      TransactionHelper.log("tcpServerProvider", transaction.toString());
      final paymentNotifier = ref.read(paymentNotifierProvider.notifier);
      paymentNotifier.setFromTcpTransaction(transaction);
      navigatorKey.currentContext!.goNamed('payment');
    },
  );

  ref.onDispose(() {
    server.stop();
  });

  return server;
});
