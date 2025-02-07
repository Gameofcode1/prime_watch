import 'package:shared_preferences/shared_preferences.dart';


class UserSharedPref {
  static const String lastPrimeTimeKey = "lastPrimeTime";

  static Future<DateTime> getLastPrimeTime() async {
    final prefs = await SharedPreferences.getInstance();
    final timeString = prefs.getString(lastPrimeTimeKey);

    if (timeString == null) {
      return DateTime.now();
    }

    try {
      return DateTime.parse(timeString);
    } catch (e) {
      return DateTime.now();
    }
  }

  static Future<void> saveLastPrimeTime(DateTime time) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(lastPrimeTimeKey, time.toIso8601String());
  }
}