final class PlatformEvent {
  final String event;
  final dynamic value;

  PlatformEvent(this.event, this.value);
}

sealed class Event {}

class StatusMessage extends Event {
  final String value;

  StatusMessage(this.value);
}

class UserApplicationSelectionRequired extends Event {
  final List<Object?> value;

  UserApplicationSelectionRequired(this.value);
}

class UserBudgetSelectionRequiredEvent extends Event {
  final List<Object?> value;
  UserBudgetSelectionRequiredEvent(this.value);
}

class TransactionCompletedEvent extends Event {
  final dynamic value;
  TransactionCompletedEvent(this.value);
}

class PrinterResultEvent extends Event {
  final dynamic value;
  PrinterResultEvent(this.value);
}

class ErrorEvent extends Event {
  final String value;
  ErrorEvent(this.value);
}

abstract class FactoryEventHandler {
  void onUserApplicationSelectionRequired(UserApplicationSelectionRequired value);
  void onUserBudgetSelectionRequiredEvent(UserBudgetSelectionRequiredEvent value);
  void onTransactionCompletedEvent(TransactionCompletedEvent value);
  void onErrorEvent(String? value);
  void onStatusMessageEvent(String? value);
  void onWaitingForCardEvent(bool value);
  void onReturnPrinterResultEvent(PrinterResultEvent value);
  void onDisConnectEvent(bool value);
}