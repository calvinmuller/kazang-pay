import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/printer.dart' show ReceiptSectionEnum;
import '../../models/transaction.dart' show Transaction;

part 'receipt.provider.g.dart';

class ReceiptParameters {
  final Transaction? transaction;
  final ReceiptSectionEnum type;
  final bool autoClose;
  final bool showPrint;

  ReceiptParameters({
    this.transaction,
    this.type = ReceiptSectionEnum.CUSTOMER,
    this.autoClose = true,
    this.showPrint = true,
  });
}

@riverpod
ReceiptParameters receiptParameters(Ref ref) => throw UnimplementedError();