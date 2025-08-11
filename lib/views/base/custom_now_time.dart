String formatRelativeTime(String startTime) {
  try {
    final now = DateTime.now();

    // Attach today's date to the time string
    final todayDate = "${now.year.toString().padLeft(4, '0')}-"
        "${now.month.toString().padLeft(2, '0')}-"
        "${now.day.toString().padLeft(2, '0')}";
    final combined = "$todayDate $startTime";

    final start = DateTime.tryParse(combined);

    if (start == null) return '';

    final diff = now.difference(start);

    if (diff.inMinutes.abs() <= 2) {
      return 'Now';
    } else if (diff.inMinutes < 60 && diff.inMinutes > 0) {
      return '${diff.inMinutes}min';
    } else if (diff.inMinutes < 0 && diff.inMinutes > -60) {
      return '${diff.inMinutes.abs()} min';
    } else if (diff.inHours < 24 && diff.inHours > 0) {
      return '${diff.inHours} Hr';
    } else if (diff.inHours < 0 && diff.inHours > -24) {
      return '${diff.inHours.abs()} Hr';
    } else {
      return '${diff.inDays.abs()} days ${diff.isNegative ? "from now" : "ago"}';
    }
  } catch (e) {
    return '';
  }
}
