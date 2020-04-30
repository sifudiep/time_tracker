import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/logic/TimeData.dart';
import 'package:time_tracker/screens/history_screen.dart';
import 'package:time_tracker/screens/tracker_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TimeData(),
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => TrackerScreen(),
          '/history_screen': (context) => HistoryScreen(),
        },
        title: 'Time Tracker',
      ),
    );
  }
}
