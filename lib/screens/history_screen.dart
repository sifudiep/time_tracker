import 'package:flutter/material.dart';
import 'package:time_tracker/logic/history_screen_logic.dart';
import 'package:time_tracker/settings.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        if (details.delta.dx > 0)
          retrieveDatesList();
        else if (details.delta.dy < 0)
          retrieveDatesList();
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: Column(
            children: <Widget>[
              Text(
                "April - 2020",
                style: titleFont,
              ),
              Expanded(
                flex: 1,
                child: GridView.count(
                  crossAxisCount: 5,
                  padding: EdgeInsets.all(25.0),
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 6,
                  children: retrieveDatesList(),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
