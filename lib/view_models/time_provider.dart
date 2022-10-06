import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:timezone/browser.dart' as tz;
import 'package:timezone/timezone.dart';

class TimeProvider extends ChangeNotifier {
  TZDateTime? now;
  DateFormat dateFormat = DateFormat('HH:mm', 'nb_NO');

  String get formattedTime {
    var detroit = tz.getLocation('Europe/Oslo');
    var now = tz.TZDateTime.now(detroit);

    return dateFormat.format(now);
  }

  Future<void> setup() async {
    tz.initializeTimeZone();
    Timer.periodic(Duration(seconds: 1), (_) {
      notifyListeners();
    });
  }

  bool isPlaying(String schedule) {
    var scheduleArr = schedule.split(' - ');
    var fromSchedule = getTimeValueForComparison(scheduleArr[0]) ?? -1;
    var toSchedule = getTimeValueForComparison(scheduleArr[1]) ?? -1;
    var currTimeValue = getTimeValueForComparison(formattedTime) ?? -1;
    return currTimeValue >= fromSchedule && currTimeValue <= toSchedule;
  }

  int? getTimeValueForComparison(String time) {
    return int.tryParse(time.replaceFirst(r':', ''));
  }
}
