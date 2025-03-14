import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/providers/transaction.provider.dart';
import '../common/widgets/receipt.dart';

class ReceiptPage extends ConsumerWidget {
  const ReceiptPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final trx = ref.watch(transactionResultNotifierProvider);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Receipt(transactionResult: trx!),
    );
  }
}
