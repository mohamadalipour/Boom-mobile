import 'package:flutter/material.dart';

class CustomProgressBar extends StatelessWidget {
  final double strokeWidth;

  const CustomProgressBar({Key key, this.strokeWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth ?? 4.0,
        valueColor: AlwaysStoppedAnimation(Colors.pink),
      ),
    );
  }
}
