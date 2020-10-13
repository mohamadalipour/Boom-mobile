import 'package:boom/model/base_http_response.dart';
import 'package:dartz/dartz.dart';


abstract class ApiClient {

  Future<Either<Exception, BaseHttpResponse>> getApi(
      {String url,
      Map<String, String> headers,
      Map<String, String> queryParams,
      bool isCalledFromItself});
}
