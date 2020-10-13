import 'dart:async';
import 'dart:convert';

import 'package:boom/base_classes/exceptions/connectivity_error_exception.dart';
import 'package:boom/base_classes/exceptions/time_out_exception.dart';
import 'package:boom/consts.dart';
import 'package:boom/data_source/base_http_client/base_http_client.dart';
import 'package:boom/model/base_http_response.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'api_client.dart';

class ApiClientImpl implements ApiClient {


  ApiClientImpl();



  @override
  Future<Either<Exception, BaseHttpResponse>> getApi(
      {String url,
      Map<String, String> headers,
      Map<String, String> queryParams,
      bool isCalledFromItself}) async {
    try {

    String fullUrl=  _getUrlWithUriBuilder(url: url,queryParams: queryParams);

      debugPrint("getting $fullUrl $headers");


      /// make http call
      final response = await BaseHttpClient()
          .getInstance()
          .get(fullUrl,
              options: Options(
                headers: headers,
              ))
          .timeout(Duration(seconds: Constes.HTTP_TIME_OUT_DURATION_IN_SECOND));



      debugPrint('response for get $fullUrl is ${response.statusCode} ${response.data}');


      return Right(BaseHttpResponse(
          body: json.encode(response.data),
          statusCode: response.statusCode,
          header: response.headers.map));
    } on TimeoutException catch (timeoutError, stacktrace) {
      debugPrint("timeout error in get method $url $timeoutError,$stacktrace");
      return Left(TimeOutException());
    } on Exception catch (error, stack) {
      debugPrint("error in get $url $error,$stack");
      return Left(ConnectivityErrorException());
    }
  }

  String _getUrlWithUriBuilder({String url,Map<String,dynamic> queryParams}) {
    return Uri.http(Constes.BaseUrl, url, queryParams)
        .toString();
  }

}
