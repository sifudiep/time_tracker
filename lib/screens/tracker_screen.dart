import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker/logic/data_storer.dart';
import 'package:time_tracker/screens/history_screen.dart';
import '../logic/time_tracker.dart';

class TrackerScreen extends StatefulWidget {
  @override
  _TrackerScreenState createState() => _TrackerScreenState();
}

class _TrackerScreenState extends State<TrackerScreen> {
  var timeTracker;
  DataStorer dataStorer;

  void updateState(seconds, minutes, hours) {
    this.setState(() {
//      seconds;
//      minutes;
//      hours;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timeTracker = new TimeTracker();
    Timer.periodic(Duration(seconds: 1), (timer) => timeTracker.updateTime(updateState));
    getApplicationDocumentsDirectory().then((Directory directory) {
      dataStorer = new DataStorer(directory);
      int trackedTime = dataStorer.retrieveTrackedTime(dataStorer.timeLog);
      timeTracker.isBuilding = dataStorer.wasBuilding();
      timeTracker.updateTracker(
          timeInSeconds: trackedTime, updatingState: updateState);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      GestureDetector(
        onTap: () {
          setState(() {
            timeTracker.isBuilding = !timeTracker.isBuilding;
          });
          dataStorer.storeTrackedTime(isBuilding: timeTracker.isBuilding);
        },
        child: Scaffold(
          backgroundColor: timeTracker.isBuilding
              ? Colors.lightBlueAccent
              : Colors.redAccent,
          body: SafeArea(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                FlatButton(
                  child: Text("HISTORY"),
                  color: Colors.orangeAccent,
                  padding:
                      EdgeInsets.only(right: 40, left: 40, top: 10, bottom: 10),
                  splashColor: timeTracker.isBuilding
                      ? Colors.deepOrangeAccent
                      : Colors.black54,
                  textColor:
                      timeTracker.isBuilding ? Colors.black : Colors.black,
                  onPressed: () {
                    Navigator.pushNamed(context, '/history_screen');
                  },
                ),
                SizedBox(
                  height: 200.0,
                ),
                Center(
                  child: Hero(
                    tag: 'dash',
                    child: Text(
                      "${timeTracker.showNegative()}${timeTracker.showHours()}:${timeTracker.showMinutes()}:${timeTracker.showSeconds()}",
                      style: TextStyle(
                          color: timeTracker.isBuilding
                              ? Colors.white
                              : Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 50.0,
                          fontFamily: "Neue Pro"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ]);
  }

  @override
  void dispose() {
    print("disposing..");
    dataStorer.storeTrackedTime(isBuilding: timeTracker.isBuilding);
    timeTracker.timer?.cancel();
    super.dispose();
  }
}
