import 'package:boom/base_widgets/base_error/base_error.dart';
import 'package:flutter/material.dart';

class ForbiddenErrorWidget extends StatelessWidget {
  final VoidCallback onBackTap;
  final Stream<String> description;

  const ForbiddenErrorWidget({Key key, @required this.onBackTap, this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: description,
      builder: (context, snapshot) {
        return BaseError(
            errorTitle: 'forbidden',
            errorDescription:snapshot.data?? 'forbiddenDescription',
            actionTitle: 'back',
            onActionButtonTap: onBackTap);
      }
    );
  }
}
