import 'dart:math';

import 'package:flutter/material.dart';

import '../dimension.dart';

class NoInternet extends StatelessWidget {
  final VoidCallback onTapRetry;

  const NoInternet({Key key, this.onTapRetry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: Scaffold(
            body: Container(
              //height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[

                  Flexible(
                    flex: 1,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: ColorButtonInNoInternet(
                            text: 'retry',
                            onTap: onTapRetry,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GradientButtonInNoInternet extends StatelessWidget {
  const GradientButtonInNoInternet({
    Key key,
    @required this.text,
    this.onTapButton,
  }) : super(key: key);

  final String text;
  final VoidCallback onTapButton;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapButton,
      child: Container(
        height: min(MediaQuery.of(context).size.height * 0.08, 60.0),
        padding: EdgeInsets.symmetric(
          horizontal: CustomDimension.x20,
        ),

        child: Center(
          child: Text(
            text,
          ),
        ),
      ),
    );
  }
}

class ColorButtonInNoInternet extends StatelessWidget {
  final String text;
  final Function onTap;
  final EdgeInsetsGeometry padding;
  final TextStyle style;

  ColorButtonInNoInternet({this.text, this.onTap, this.padding, this.style});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        // padding: EdgeInsets.symmetric(vertical: 25),

        child: Center(
            child: Container(
          padding: padding,
          child: Text(
            "$text",
            maxLines: 1,
            style: style,
          ),
        )),
      ),
    );
  }
}
