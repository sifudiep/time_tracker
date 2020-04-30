import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'date_container.dart';

class LoggedDate extends StatelessWidget {
  LoggedDate({@required this.date, @required this.extraTime, @required this.color});

  final String date;
  final String extraTime;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return FlipCard(
        speed: 300,
        front: DateContainer(
          content: date,
          backgroundColor: color,
        ),
        back: DateContainer(
          content: extraTime,
          backgroundColor: color,
        ));
  }
}