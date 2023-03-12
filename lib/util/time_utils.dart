abstract class TimeUtils {
  /// Example: 4830 -> '1h 20min 30sec'
  static String convertSecondsToTimeString(int seconds) {
    String secondsText = '${seconds % 60}s';
    String minutesText = '';
    String hoursText = '';
    int minutes = (seconds / 60).floor();
    if (minutes != 0) {
      minutesText = '${minutes % 60}min ';
    }
    int hours = (minutes / 60).floor();
    if (hours != 0) {
      hoursText = '${hours}h ';
    }
    return '$hoursText$minutesText$secondsText';
  }
}
