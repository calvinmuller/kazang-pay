import 'package:dio/dio.dart' show Dio, DioException;
import 'package:intl/intl.dart' show DateFormat;

import '../models/crm.dart' show CrmGenericResponse;
import '../models/kazang.dart';

class KazangRepository {
  KazangRepository(this.client);

  final Dio client;

  Future<dynamic> getLocale(LoginRequest accountInfo) {
    return client.post('cps-web/api/tacs/get-locale', data: {
      "user": accountInfo.accountNumber,
      "serial_number": accountInfo.serialNumber,
    });
  }

  Future getProfile(LoginRequest accountInfo) async {
    try {
      final response = await client.post('cps-web/api/tacs/get-profile', data: {
        "user": accountInfo.accountNumber,
        "serial_number": accountInfo.serialNumber,
      });
      return response.data;
    } on DioException catch (e) {
      throw e.response?.data['response_message'] ?? "Error fetching profile";
    }
  }

  Future<TransactionSummaryResponse?> getTransactionHistorySummary(
      String merchantId,
      String terminalId,
      DateTime fromDate,
      DateTime toDate,
      String locale) async {
    DateFormat df = DateFormat('yyyy-MM-dd');

    try {
      final response =
          await client.post('cps-web/api/transaction-history/summary', data: {
        "merchant_id": merchantId,
        "terminal_id": terminalId,
        "from_date": df.format(fromDate),
        "to_date": df.format(toDate),
        "locale": locale
      });

      return TransactionSummaryResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<TransactionHistoryDetails> getTransactionHistoryDetails(
      String merchantId,
      String terminalId,
      DateTime fromDateTime,
      DateTime toDateTime,
      String locale) async {
    DateFormat df = DateFormat('yyyy-MM-ddTHH:mm:ss');

    final response =
        await client.post('cps-web/api/transaction-history/details', data: {
      "merchant_id": merchantId,
      "terminal_id": terminalId,
      "from_datetime": df.format(fromDateTime),
      "to_datetime": df.format(toDateTime),
      "locale": locale
    });
    return TransactionHistoryDetails.fromJson(response.data);
  }
}

class CrRepository {
  CrRepository(this.client);

  final Dio client;

  Future<LoginResponse> authDevice(LoginRequest loginRequest) async {
    final response = await client.post('api_rest/auth_device', data: {
      "account_number": loginRequest.accountNumber,
      "password": loginRequest.password,
      "serial_number": loginRequest.serialNumber
    });
    if (response.data['response_code'] != 0) {
      throw Exception(response.data['response_message']);
    }
    return LoginResponse.fromJson(response.data);
  }
}

class CrmRepository {
  CrmRepository(this.client);

  final Dio client;

  Future<CrmGenericResponse> addDevice(LoginRequest loginRequest) async {
    final data = {
      "KazangAccountNumber": loginRequest.accountNumber,
      "SerialNumber": loginRequest.serialNumber
    };
    try {
      final response = await client.post('crm/add-terminal', data: data);
      return CrmGenericResponse.fromJson(response.data);
    } on DioException catch (e) {
      return CrmGenericResponse.fromJson(e.response?.data ??
          {
            "kazang_account_number": loginRequest.accountNumber,
            "status": 3,
            "request_type": "0",
            "status_description": "An error occurred connecting to the server"
          });
    }
  }

  Future<CrmGenericResponse> getRequestStatus(
    String accountNumber,
    String requestType,
  ) async {
    final data = {
      "kazang_account_number": accountNumber,
      "request_type": requestType,
      "request_additional": ""
    };

    try {
      final response = await client.post('crm/get-request-status', data: data);
      if (response.data is String &&
          !response.data.toString().contains("is linked to another")) {
        throw Exception(response.data);
      }
      return CrmGenericResponse.fromJson(response.data);
    } on DioException {
      rethrow;
    }
  }
}
