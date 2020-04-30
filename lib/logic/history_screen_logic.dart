import 'package:flutter/cupertino.dart';
import 'package:time_tracker/settings.dart';
import 'package:time_tracker/ui_components/date_container.dart';
import 'package:time_tracker/ui_components/logged_date.dart';
import 'data_storer.dart';

List<Widget> retrieveDatesList() {
  List<Widget> widgetList = [];
  widgetList.add(LoggedDate(date: "1", extraTime: "+02:30", color: positiveTimeColor,));
  for (int i = 2; i < 32; i++) {
    widgetList.add(DateContainer(content: "$i",backgroundColor: notLoggedColor,));
  }
  print("widgetList.length :${widgetList.length}");
  return widgetList;
}