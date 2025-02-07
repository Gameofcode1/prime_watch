import 'dart:async';

import 'package:intl/intl.dart';

class TimeHelper {
  static Timer startClock(Function(DateTime) onTick) {
    return Timer.periodic(
      const Duration(seconds: 1),
          (_) => onTick(DateTime.now()),
    );
  }


  static String formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    return '${hours.toString().padLeft(2, '0')}:'
        '${minutes.toString().padLeft(2, '0')}:'
        '${seconds.toString().padLeft(2, '0')}';
  }



  static String getFormattedDate(DateTime dateTime) {
    String germanWeekday = DateFormat('E', 'de_DE').format(dateTime);
    germanWeekday = germanWeekday[0].toUpperCase() + germanWeekday.substring(1);
    String dayMonth = DateFormat('d. MMM.').format(dateTime);
    return '$germanWeekday. $dayMonth';
  }

  static  int getCalendarWeek(DateTime date) {
    final dayOfYear = int.parse(DateFormat('D').format(date));
    final weekDay = date.weekday;
    final woy = ((dayOfYear - weekDay + 10) / 7).floor();
    return woy;
  }

}