import 'package:boom/base_widgets/base_error/base_error.dart';
import 'package:flutter/material.dart';

class BadRequestErrorWidget extends StatelessWidget {
  final VoidCallback onBackTap;
  final Stream<String> description;

  const BadRequestErrorWidget({Key key, @required this.onBackTap, this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: description,
      builder: (context, snapshot) {
        return BaseError(
            errorTitle: 'badRequest',
            errorDescription: snapshot.data ?? 'badRequestDescription',
            actionTitle: 'back',
            onActionButtonTap: onBackTap);
      }
    );
  }
}
