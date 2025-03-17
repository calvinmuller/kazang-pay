
import 'package:flutter/material.dart' show BuildContext, Scaffold, Widget, Colors;
import 'package:flutter_riverpod/flutter_riverpod.dart' show ConsumerWidget;
import '../common/widgets/receipt.dart';
import '../models/transaction.dart';

class ReceiptPage extends ConsumerWidget {
  const ReceiptPage({super.key, required this.transaction});

  final Transaction transaction;

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Receipt(transaction: transaction),
    );
  }
}
