import 'package:flutter/material.dart' show DateTimeRange;
import 'package:flutter_riverpod/flutter_riverpod.dart' show Ref, StateProvider;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../helpers/date_helpers.dart';
import '../../helpers/transaction_helper.dart';
import '../../models/kazang.dart';
import '../../models/transaction.dart';
import '../../models/transaction_result.dart';
import 'api.provider.dart';
import 'app.provider.dart';

part 'transaction.provider.g.dart';

var currentTransactionItem = Provider<Transaction>((ref) => throw UnimplementedError());

var currentSettlement = Provider<Settlement>((ref) => throw UnimplementedError());

final dateTimeFilterProvider = StateProvider(
      (_) => DateTimeRange(
    start: DateTime.now().subtract(const Duration(days: 31)),
    end: DateTime.now(),
  ),
);

@Riverpod(keepAlive: true)
class TransactionResultNotifier extends _$TransactionResultNotifier {
  @override
  TransactionResult? build() => null;

  void set(TransactionResult transactionResult) {
    state = transactionResult;
  }
}

/// API Section
@riverpod
Future<List<Transaction>> transactionHistory(Ref ref) async {
  final dateRange = ref.watch(dateTimeFilterProvider);
  final transactions = await TransactionHelper.getHistoryData();

  final startOfDate = startOfDay(dateRange.start);
  final endOfDate = endOfDay(dateRange.end);

  return transactions.where((transaction) => transaction.transactionDateTime.isAfter(startOfDate) && transaction.transactionDateTime.isBefore(endOfDate)).toList();
}

@riverpod
Future<TransactionSummaryResponse> settlements(Ref ref) async {
  final dateRange = ref.watch(dateTimeFilterProvider);
  final api = ref.watch(kazangRepositoryProvider);
  final appState = ref.watch(appNotifierProvider);
  final merchantId = appState.profile!.merchantConfig.merchantNumber;
  final terminalId = appState.profile!.terminalConfig.terminalId;
  final fromDate = dateRange.start;
  final toDate = dateRange.end;
  final locale = appState.profile!.terminalConfig.currencyCode;
  final settlements = await api.getTransactionHistorySummary(merchantId, terminalId, fromDate, toDate, locale);

  return settlements!;
}

@riverpod
Future<TransactionHistoryDetails> settlementDetails(Ref ref, DateTime date) async {
  final api = ref.read(kazangRepositoryProvider);
  final appState = ref.read(appNotifierProvider);
  final merchantId = appState.profile!.merchantConfig.merchantNumber;
  final terminalId = appState.profile!.terminalConfig.terminalId;
  final fromDate = startOfDay(date);
  final toDate = endOfDay(date);
  final locale = appState.profile!.terminalConfig.currencyCode;

  final settlementDetails = await api.getTransactionHistoryDetails(merchantId, terminalId, fromDate, toDate, locale);

  return settlementDetails;
}

@riverpod
Future<Transaction> getByReferenceData(Ref ref, String rrn) async {
  return await TransactionHelper.getByReferenceData(rrn);
}

@riverpod
final transactionStepProvider = StateProvider.autoDispose<int>((ref) => 0);