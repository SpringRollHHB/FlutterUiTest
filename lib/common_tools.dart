import 'dart:io'; // 用于 Platform.localeName
import 'package:intl/intl.dart'; // 用于 DateFormat


String getFormatTimeByDateTime(DateTime? dateTime, String format) {
  if (dateTime == null) {
    return "";
  }

  try {
    DateFormat formatter = DateFormat(format,Platform.localeName);
    return formatter.format(dateTime);
  } catch (e) {
    return "";
  }
}