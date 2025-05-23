class TcpTransaction {
  final num amount;
  final num cashbackAmount;
  final String type;
  final String uniqueId;
  final String port;
  final String timeout;
  final String refNo;

  TcpTransaction({
    required this.amount,
    required this.cashbackAmount,
    required this.type,
    required this.uniqueId,
    required this.port,
    required this.timeout,
    required this.refNo,
  });

  factory TcpTransaction.fromJson(Map<String, dynamic> json) {
    return TcpTransaction(
      amount: int.parse(json['amount'] as String),
      cashbackAmount: int.parse(json['cashbackAmount'] as String),
      type: json['type'] as String,
      uniqueId: json['uniqueId'] as String,
      port: json['port'] as String,
      timeout: json['timeout'] as String,
      refNo: json['refNo'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'cashbackAmount': cashbackAmount,
      'type': type,
      'uniqueId': uniqueId,
      'port': port,
      'timeout': timeout,
      'refNo': refNo,
    };
  }

  @override
  String toString() {
    return 'TcpTransaction(amount: $amount, cashbackAmount: $cashbackAmount, type: $type, uniqueId: $uniqueId, port: $port, timeout: $timeout, refNo: $refNo)';
  }
}
