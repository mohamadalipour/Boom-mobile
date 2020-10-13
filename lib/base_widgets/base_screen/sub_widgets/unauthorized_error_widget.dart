import 'package:boom/base_widgets/base_error/base_error.dart';
import 'package:flutter/material.dart';

class UnauthorizedErrorWidget extends StatelessWidget {
  final VoidCallback onRetryTap;
  final Stream<String> description;
  const UnauthorizedErrorWidget({Key key, @required this.onRetryTap, this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: description,
      builder: (context, snapshot) {
        return BaseError(
            errorTitle: 'unauthorized',
            errorDescription:snapshot.data?? 'unauthorizedDescription',
            actionTitle: 'retry',
            onActionButtonTap: onRetryTap);
      }
    );
  }
}
