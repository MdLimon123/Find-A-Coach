import 'package:timeago/timeago.dart' as timeago;
String formatJoinTime(String dateStr) {
  final dateTime = DateTime.parse(dateStr);
  return timeago.format(dateTime, allowFromNow: true);
}