import 'package:flutter/material.dart';

import '../../dimension.dart';

class BaseError extends StatelessWidget {

  final String errorTitle;
  final String errorDescription;
  final String actionTitle;
  final VoidCallback onActionButtonTap;

  const BaseError({
    Key key,
    @required this.errorTitle,
    @required this.errorDescription,
    @required this.actionTitle,
    @required this.onActionButtonTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SafeArea(
          child: Scaffold(
            body: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [

                ],
              ),
              margin: EdgeInsets.all(CustomDimension.x20),
              padding: EdgeInsets.symmetric(horizontal: CustomDimension.x20,vertical: CustomDimension.x20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [

                  Text(
                    errorTitle,

                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    child: Text(
                      errorDescription,

                      textAlign: TextAlign.center,
                    ),
                    padding: const EdgeInsets.all(CustomDimension.x12),
                  ),

                ],
              ),
            ),
          ),
        ));
  }
}
