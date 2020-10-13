import 'dart:convert';

import 'package:boom/model/base_http_response.dart';
import 'package:boom/model/base_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import '../utils.dart';
import 'exceptions/parse_json_exception.dart';

abstract class BaseRepository {


  Either<Exception, List<T>> parseListRightValue<T extends JsonParser>(
      T model, BaseHttpResponse response) {
    try {
      if (Utils.isSuccessStatusCode(response.statusCode)) {
        return Right(
            BaseModelList.fromListResponse(json.decode(response.body), model)
                .data);
      } else {
        return Left(Utils.getExceptionType(response));
      }
    } catch (error, stacktrace) {
      debugPrint('failed to parse json in $model $error , $stacktrace');
      return Left(ParseJsonException());
    }
  }

}
