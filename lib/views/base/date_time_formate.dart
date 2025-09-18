import 'package:intl/intl.dart';

/// Returns a Map with 'dateText' and 'timeText'
Map<String, String> formatSessionParts(String sessionDate, String sessionTime) {
  // Parse date and time from API
  final date = DateTime.parse(sessionDate); // e.g. 2025-09-20
  final timeParts = sessionTime.split(':');
  final sessionDateTime = DateTime(
    date.year,
    date.month,
    date.day,
    int.parse(timeParts[0]),
    int.parse(timeParts[1]),
  );

  final now = DateTime.now();
  final isToday = now.year == date.year &&
      now.month == date.month &&
      now.day == date.day;

  late String dateText;
  late String timeText;

  if (isToday) {
    dateText = 'Today';
    // Show "Now" if current time >= session time, else show formatted time
    final formattedTime = DateFormat.jm().format(sessionDateTime);
    timeText = now.isAfter(sessionDateTime) ? 'Now' : formattedTime;
  } else {
    // Example: "Monday, June 15"
    dateText = DateFormat('EEEE, MMM d').format(date);
    timeText = DateFormat.jm().format(sessionDateTime);
  }

  return {'dateText': dateText, 'timeText': timeText};
}
