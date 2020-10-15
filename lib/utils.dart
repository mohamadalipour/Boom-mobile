import 'dart:convert';

import 'package:boom/model/base_http_response.dart';

import 'base_classes/exceptions/bad_request_exception.dart';
import 'base_classes/exceptions/forbidden_exception.dart';
import 'base_classes/exceptions/internal_server_error_exception.dart';
import 'base_classes/exceptions/method_not_allowed_exception.dart';
import 'base_classes/exceptions/not_found_exception.dart';
import 'base_classes/exceptions/unauthorized_exception.dart';
import 'base_classes/exceptions/unsupported_media_type_exception.dart';
import 'consts.dart';


import 'model/error_model.dart';







class Utils{
  static Map<String, String>  get getDefaultHeader=>
      {
        "Content-type": "application/json",
        "Authorization":
        "Bearer " + '\$2a\$10\$AXzBR9uXoX/rfRjhkXGnf.3ZSKwuefWDC4By4Z9315xcs9DhOHHse'
      };


  static bool isSuccessStatusCode(int httpResponseCode) {
    if (httpResponseCode >= 200 && httpResponseCode < 300) return true;
    return false;
  }

  static Exception getExceptionType(BaseHttpResponse httpResponse) {
    if (httpResponse.statusCode == Constes.BAD_REQUEST_STATUS_CODE) {
      return BadRequestException(
          message: parseErrorMessageFromResponse(httpResponse.body));
    }

    if (httpResponse.statusCode == Constes.UNAUTHORIZED_STATUS_CODE) {
      return UnAuthorizedException(
          message: parseErrorMessageFromResponse(httpResponse.body));
    }

    if (httpResponse.statusCode == Constes.FORBIDDEN_STATUS_CODE) {
      return ForbiddenException(
          message: parseErrorMessageFromResponse(httpResponse.body));
    }

    if (httpResponse.statusCode == Constes.NOT_FOUND_STATUS_CODE) {
      return NotFoundException(
          message: parseErrorMessageFromResponse(httpResponse.body));
    }

    if (httpResponse.statusCode == Constes.METHOD_NOT_ALLOWED_STATUS_CODE) {
      return MethodNotAllowedException(
          message: parseErrorMessageFromResponse(httpResponse.body));
    }

    if (httpResponse.statusCode == Constes.UNSUPPORTED_MEDIA_TYPE_STATUS_CODE) {
      return UnSupportedMediaTypeException(
          message: parseErrorMessageFromResponse(httpResponse.body));
    }

    return InternalServerErrorException(
        message: parseErrorMessageFromResponse(httpResponse.body));
  }


  static String parseErrorMessageFromResponse(String e) {
    try {
      if (!Utils.isNullOrEmpty(e)) {
        return ErrorModel.fromJson(
          json.decode((e)),
        ).description;
      }
      return null;
    } catch (error) {
      return null;
    }
  }

  static bool isNullOrEmpty(String element) {
    if (element == null || element.isEmpty || element == '\"\"') return true;
    return false;
  }

}