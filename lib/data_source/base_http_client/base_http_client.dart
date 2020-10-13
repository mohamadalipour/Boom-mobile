import 'package:boom/consts.dart';
import 'package:dio/dio.dart';

class BaseHttpClient {
  Dio dio;

  static final BaseHttpClient _instance = BaseHttpClient.internal();

  factory BaseHttpClient() => _instance;

  BaseHttpClient.internal() {
    dio = Dio();
    dio.options = BaseOptions(
        responseType: ResponseType.json,
        validateStatus: (statusCode) => statusCode < 550,
        connectTimeout: Constes.HTTP_TIME_OUT_DURATION_IN_SECOND * 1000);
  }

  Dio getInstance() => dio;
}
