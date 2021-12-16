import 'package:intl/intl.dart';

class Util {
  static String appId = "451a2208247a7e5366c7a87888da6261";

  static String getFormattedDate(DateTime dateTime){
    return DateFormat("EEEEEEE, MMM d, yyyy").format(dateTime);
  }


}