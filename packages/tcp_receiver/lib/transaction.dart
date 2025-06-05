class TcpTransaction {
  final String accountNumber;
  final String cardNumber;
  final int amount;
  final int cashbackAmount;
  final String type;
  final String uniqueId;
  final String port;
  final String timeout;
  final String refNo;

  TcpTransaction({
    required this.accountNumber,
    required this.cardNumber,
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
      accountNumber: json['accountNumber'] as String,
      cardNumber: json['cardNumber'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accountNumber': accountNumber,
      'cardNumber': cardNumber,
      'amount': amount,
      'cashbackAmount': cashbackAmount,
      'type': type,
      'uniqueId': uniqueId,
      'port': port,
      'timeout': timeout,
      'refNo': refNo,
    };
  }

  get isVoid {
    return type == 'Cancel';
  }

  @override
  String toString() {
    return 'TcpTransaction(accountNumber: $accountNumber, cardNumber: $cardNumber, amount: $amount, cashbackAmount: $cashbackAmount, type: $type, uniqueId: $uniqueId, port: $port, timeout: $timeout, refNo: $refNo)';
  }

  static fromString(String msg) {
    // 1001162167|42615555|0000000250|0000000000|1|00000000000001234567|8551|75000| |SS|
    final parts = msg.split('|');
    if (parts.length < 9) {
      throw FormatException('Invalid message format: $msg');
    }

    var amount = int.parse(parts[2]);
    var cashbackAmount = int.parse(parts[3]);

    if (parts[4] == '3') {
      // If type is Cash_withdrawal, set amount to 0
      amount = 0;
      cashbackAmount = int.parse(parts[2]);
    }

    return TcpTransaction(
      accountNumber: parts[0],
      cardNumber: parts[1],
      amount: amount,
      cashbackAmount: cashbackAmount,
      type: switch (parts[4]) {
        '1' => 'Purchase',
        '2' => 'Purchase_with_cash_back',
        '3' => 'Cash_withdrawal',
        '4' => 'Cancel',
        '5' => 'Refund',
        _ => throw FormatException('Unknown transaction type: ${parts[4]}'),
      },
      uniqueId: parts[5],
      port: parts[6],
      timeout: parts[7],
      refNo: parts[8].replaceAll('SS', '').trim(),
    );
  }
}

class TcpTransactionResponse {
  final String status;
  final String responseCode;
  final String message;
  final String uniqueId;
  final String rrn;
  final String panBin;

  TcpTransactionResponse({
    required this.status,
    required this.responseCode,
    required this.message,
    required this.uniqueId,
    required this.rrn,
    required this.panBin,
  });

  factory TcpTransactionResponse.fromJson(Map<String, dynamic> json) {
    return TcpTransactionResponse(
      status: json['status'] as String,
      responseCode: json['responseCode'] as String,
      message: json['message'] as String,
      uniqueId: json['uniqueId'] as String,
      rrn: json['rrn'] as String,
      panBin: json['panBin'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'responseCode': responseCode,
      'message': message,
      'uniqueId': uniqueId,
      'rrn': rrn,
      'panBin': panBin,
    };
  }

  @override
  String toString() {
    // return the string to be send back but it must be joined with a "|" separator and an SS| at the end
    return '$status|$responseCode|$message|$uniqueId|$rrn|$panBin|SS|';
  }
}
