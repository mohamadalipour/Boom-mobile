import 'package:boom/base_widgets/base_screen/sub_widgets/bad_request_error_widget.dart';
import 'package:boom/base_widgets/base_screen/sub_widgets/failde_to_parse_json_error_jwidget.dart';
import 'package:boom/base_widgets/base_screen/sub_widgets/forbidden_error_widget.dart';
import 'package:boom/base_widgets/base_screen/sub_widgets/internal_server_error_widget.dart';
import 'package:boom/base_widgets/base_screen/sub_widgets/not_found_error_widget.dart';
import 'package:boom/base_widgets/base_screen/sub_widgets/unauthorized_error_widget.dart';
import 'package:boom/base_widgets/base_screen/sub_widgets/unsupported_media_type_error_widget.dart';
import 'package:boom/model/screen_state.dart';
import 'package:flutter/material.dart';


import '../../dimension.dart';
import '../custom_progress_bar.dart';
import '../idle_widget.dart';
import '../no_internet.dart';

class BaseScreen extends StatelessWidget {
  final BaseScreenState baseScreenState;
  final Stream<String> errorDescription;
  final VoidCallback onTapRetry;
  final IdleWidget idleWidget;
  final Widget customLoading;
  final Widget badRequestWidget;
  final Widget unAuthorizedWidget;
  final Widget forbiddenWidget;
  final Widget notFoundWidget;
  final Widget methodNotAllowedWidget;
  final Widget unsupportedMediaTypeWidget;
  final Widget internalServerErrorWidget;
  final Widget timeOutExceptionWidget;
  final Widget failedToParseJsonWidget;

  const BaseScreen({
    Key key,
    @required this.onTapRetry,
    @required this.idleWidget,
    @required this.baseScreenState,
    this.customLoading,
    this.badRequestWidget,
    this.unAuthorizedWidget,
    this.forbiddenWidget,
    this.notFoundWidget,
    this.methodNotAllowedWidget,
    this.unsupportedMediaTypeWidget,
    this.internalServerErrorWidget,
    this.timeOutExceptionWidget,
    this.errorDescription,
    this.failedToParseJsonWidget,
  })  : assert(baseScreenState != null),
        assert(onTapRetry != null),
        assert(idleWidget != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (baseScreenState) {
      case BaseScreenState.loading:
        return customLoading ??
            Material(
              child: Container(
                padding: EdgeInsets.all(CustomDimension.x16),
                child: CustomProgressBar(),
              ),
            );
        break;
      case BaseScreenState.okHttpResponse:
        return customLoading ??
            Material(
              child: Container(
                padding: EdgeInsets.all(CustomDimension.x16),
                child: CustomProgressBar(),
              ),
            );
        break;
      case BaseScreenState.failedToParseJson:
        return failedToParseJsonWidget ??
            Material(
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(CustomDimension.x16),
                  child: Text('خطا در خواندن اطلاعات'),
                ),
              ),
            );
        break;
      case BaseScreenState.connectivityError:
        return NoInternet(
          onTapRetry: onTapRetry,
        );
        break;
      case BaseScreenState.idle:
        return Container(
          child: idleWidget.getIdleWidget(),
        );
        break;
      case BaseScreenState.badRequest:
        return badRequestWidget ??
            BadRequestErrorWidget(
              description: errorDescription,
              onBackTap: () => Navigator.of(context).pop(),
            );
        break;
      case BaseScreenState.unAuthorized:
        return unAuthorizedWidget ??
            UnauthorizedErrorWidget(
              description: errorDescription,
              onRetryTap: onTapRetry,
            );
        break;
      case BaseScreenState.forbidden:
        return forbiddenWidget ??
            ForbiddenErrorWidget(
              description: errorDescription,
              onBackTap: () => Navigator.of(context).pop(),
            );
        break;
      case BaseScreenState.notFound:
        return notFoundWidget ??
            NotFoundErrorWidget(
              description: errorDescription,
              onBackTap: () => Navigator.of(context).pop(),
            );
        break;
      case BaseScreenState.methodNotAllowed:
        return methodNotAllowedWidget ?? //todo: add method not allowed error type
            Material(
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(CustomDimension.x16),
                  child: Text('method Not Allowed'),
                ),
              ),
            );
        break;
      case BaseScreenState.unsupportedMediaType:
        return unsupportedMediaTypeWidget ??
            UnsupportedMediaTypeErrorWidget(
              description: errorDescription,
              onBackTap: () => Navigator.of(context).pop(),
            );
        break;
      case BaseScreenState.internalServerError:
        return internalServerErrorWidget ??
            InternalServerErrorWidget(
              description: errorDescription,
              onRetryTap: onTapRetry,
            );
        break;
      case BaseScreenState.timeOutException:
        return timeOutExceptionWidget ??
            FailedToParseJsonWidget(
              description: errorDescription,
              onRetryTap: onTapRetry,
            );
        break;

      case BaseScreenState.failedToParseJson:

      default:
        return Container();
    }
  }
}
