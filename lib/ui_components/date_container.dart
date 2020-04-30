import 'package:flutter/material.dart';
import '../settings.dart';

class DateContainer extends StatelessWidget {
  DateContainer({@required this.content, @required this.backgroundColor});
  final String content;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(40.0))),
      child: Center(
        child: Text(
          "$content",
          style: cardFontStyle,
        ),
      ),
    );
  }
}
