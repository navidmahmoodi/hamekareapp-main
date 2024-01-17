import 'package:dio/dio.dart';

import '../tools/logger.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    loggerNoStack.i('${options.headers}');
    loggerNoStack.i(
        "--> ${options.method} ${options.path}\nContent type: ${options.contentType}\n<-- END HTTP");
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    printWrapped(
        "<-- ${response.statusCode} ${response.requestOptions.method} ${response.requestOptions.path}\n ${response.data}\n<-- END HTTP");
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    loggerNoStack.e("<-- Error --> \n ${err.error} \n ${err.message}");
    return super.onError(err, handler);
  }

  void printWrapped(String text) {
    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern
        .allMatches(text)
        .forEach((match) => loggerNoStack.i(match.group(0)));
  }
}
