import 'package:boom/base_widgets/base_error/base_error.dart';
import 'package:flutter/material.dart';


class NotFoundErrorWidget extends StatelessWidget {
  final VoidCallback onBackTap;
  final Stream<String> description;

  const NotFoundErrorWidget({Key key, @required this.onBackTap, this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: description,
      builder: (context, snapshot) {
        return BaseError(

            errorTitle: 'notFound',
            errorDescription:snapshot.data?? 'notFoundDescription',
            actionTitle: 'back',
            onActionButtonTap: onBackTap);
      }
    );
  }
}
