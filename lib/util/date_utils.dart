abstract class DateUtil {

  static DateTime fromStringInputs(String day, String month, String year) {
    return DateTime(int.parse(year), int.parse(month), int.parse(day));
  }

}