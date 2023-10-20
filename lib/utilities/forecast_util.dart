import 'package:intl/intl.dart';

class Util {
 static String getFormattedData(DateTime dateTime) {
   return DateFormat('EEE, MMM d, y').format(dateTime);
 }
}