

import 'package:intl/intl.dart';

String formatStartTime(String rawTime) {
  try {
    final dateTime = DateTime.parse("2025-01-01 $rawTime");
    return DateFormat.jm().format(dateTime); // e.g., 4:54 PM
  } catch (e) {
    return rawTime;
  }
}
