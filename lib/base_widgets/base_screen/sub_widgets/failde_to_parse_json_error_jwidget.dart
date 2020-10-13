import 'package:boom/base_widgets/base_error/base_error.dart';
import 'package:flutter/material.dart';


class FailedToParseJsonWidget extends StatelessWidget {
  final VoidCallback onRetryTap;
  final Stream<String> description;

  const FailedToParseJsonWidget(
      {Key key, @required this.onRetryTap, this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
        stream: description,
        builder: (context, snapshot) {
          return BaseError(

              errorTitle: 'requestTimeOut',
              errorDescription: snapshot.data ?? 'requestTimeOutDescription',
              actionTitle: 'retry',
              onActionButtonTap: onRetryTap);
        });
  }
}
