import 'package:boom/base_widgets/base_error/base_error.dart';
import 'package:flutter/material.dart';


class UnsupportedMediaTypeErrorWidget extends StatelessWidget {
  final VoidCallback onBackTap;
  final Stream<String> description;
  const UnsupportedMediaTypeErrorWidget({Key key, @required this.onBackTap, this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: description,
      builder: (context, snapshot) {
        return BaseError(
            errorTitle: 'unsupportedMediaType',
            errorDescription:snapshot.data?? 'unsupportedMediaTypeDescription',
            actionTitle: 'back',
            onActionButtonTap: onBackTap);
      }
    );
  }
}
