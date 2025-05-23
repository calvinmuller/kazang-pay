import 'package:dio/dio.dart';

import '../../helpers/transaction_helper.dart';

class LoggingInterceptor implements InterceptorsWrapper {
  @override
  void onError(DioException e, ErrorInterceptorHandler handler) {
    TransactionHelper.log(
        "Kazang API", "Error: ${e.response?.data.toString() ?? e.message}");
    handler.next(e);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    TransactionHelper.log("Kazang API",
        "${options.method} ${options.uri.toString()} ${options.data.toString()}");
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    TransactionHelper.log("Kazang API",
        "Response: ${response.statusCode} ${response.data.toString()}");
    handler.next(response);
  }
}
