import 'package:dio/dio.dart';
import 'package:testeliteflower/src/constants_app.dart';

final String baseApiUrl = ConstantsApp.URL_HTTP;

Dio getHttpClient() {
  Dio dio = Dio(BaseOptions(
    baseUrl: baseApiUrl,
  ));

  return dio;
}
