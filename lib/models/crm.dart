class CrmGenericResponse {
  CrmGenericResponse({
    required this.kazangAccountNumber,
    required this.status,
    required this.requestType,
    required this.statusDescription,
  });

  final String kazangAccountNumber;
  final StatusResult status;
  final String requestType;
  final String statusDescription;

  factory CrmGenericResponse.fromJson(Map<String, dynamic> json) => CrmGenericResponse(
    kazangAccountNumber: json["kazang_account_number"],
    status: StatusResult.values[json["status"]],
    requestType: json["request_type"].toString(),
    statusDescription: json["status_description"],
  );

  Map<String, dynamic> toJson() => {
    "kazang_account_number": kazangAccountNumber,
    "status": status,
    "request_type": requestType,
    "status_description": statusDescription,
  };

  get isLinked => status == StatusResult.Failed && statusDescription.contains("is linked to another");
}

enum StatusResult {
  New,
  InProgress,
  Success,
  Failed
}
