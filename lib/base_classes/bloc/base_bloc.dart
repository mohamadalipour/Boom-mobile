import 'dart:convert';
import 'package:boom/base_classes/exceptions/bad_request_exception.dart';
import 'package:boom/base_classes/exceptions/connectivity_error_exception.dart';
import 'package:boom/base_classes/exceptions/forbidden_exception.dart';
import 'package:boom/base_classes/exceptions/internal_server_error_exception.dart';
import 'package:boom/base_classes/exceptions/method_not_allowed_exception.dart';
import 'package:boom/base_classes/exceptions/not_found_exception.dart';
import 'package:boom/base_classes/exceptions/parse_json_exception.dart';
import 'package:boom/base_classes/exceptions/time_out_exception.dart';
import 'package:boom/base_classes/exceptions/unauthorized_exception.dart';
import 'package:boom/base_classes/exceptions/unsupported_media_type_exception.dart';
import 'package:boom/model/error_model.dart';
import 'package:boom/model/screen_state.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';
import '../../utils.dart';

class BaseBLoC {
  BehaviorSubject<BaseScreenState> _baseScreenState;

  Stream<BaseScreenState> get getScreenState => _baseScreenState;

  BehaviorSubject<String> _errorDescription;

  Stream<String> get getBaseError => _errorDescription;

  BaseBLoC() {
    _errorDescription = BehaviorSubject<String>();
    _baseScreenState = BehaviorSubject<BaseScreenState>();
  }

  BaseScreenState get getLastValueOfStream => _baseScreenState.value;

  void addNewStateToScreenAndIgnoreRepetitiveState(BaseScreenState state) {
    if (state == BaseScreenState.idle) {
      _baseScreenState.add(state);
      debugPrint('adding new state to base screen $state');
      return;
    }

    ///ignore if last value of state is equals given state
    if (_baseScreenState.value == state) return;

    _baseScreenState.add(state);

    debugPrint('adding new state to base screen $state');
  }


  void parseErrorMessage(String e) {
    if (!Utils.isNullOrEmpty(e)) {
      this._errorDescription.add(ErrorModel.fromJson(
            json.decode((e)),
          ).description);
    }
  }

  void baseBlocDispose() {
    _baseScreenState.drain();
    _baseScreenState.close();
    _errorDescription.close();
  }

  mapExceptionToEnum(Exception exception) {
    if (exception is BadRequestException) {
      _errorDescription.add(exception.message);
      _baseScreenState.add(BaseScreenState.badRequest);
    }

    if (exception is UnAuthorizedException) {
      _errorDescription.add(exception.message);
      _baseScreenState.add(BaseScreenState.unAuthorized);
    }

    if (exception is ForbiddenException) {
      _errorDescription.add(exception.message);
      _baseScreenState.add(BaseScreenState.forbidden);
    }

    if (exception is NotFoundException) {
      _errorDescription.add(exception.message);
      _baseScreenState.add(BaseScreenState.notFound);
    }

    if (exception is MethodNotAllowedException) {
      _errorDescription.add(exception.message);
      _baseScreenState.add(BaseScreenState.methodNotAllowed);
    }

    if (exception is UnSupportedMediaTypeException) {
      _errorDescription.add(exception.message);
      _baseScreenState.add(BaseScreenState.unsupportedMediaType);
    }

    if (exception is InternalServerErrorException) {
      _errorDescription.add(exception.message);
      _baseScreenState.add(BaseScreenState.internalServerError);
    }

    if (exception is ParseJsonException) {
      _errorDescription.add(exception.message);
      _baseScreenState.add(BaseScreenState.failedToParseJson);
    }

    if (exception is ConnectivityErrorException) {
      _errorDescription.add(exception.message);
      _baseScreenState.add(BaseScreenState.connectivityError);
    }

    if (exception is TimeOutException) {
      _errorDescription.add(exception.message);
      _baseScreenState.add(BaseScreenState.timeOutException);
    }
  }
}
