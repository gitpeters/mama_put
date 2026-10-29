const _months = [
  'January', 'February', 'March', 'April', 'May', 'June',
  'July', 'August', 'September', 'October', 'November', 'December',
];

String dateGroupLabel(DateTime date, DateTime now) {
  // Strip the time so we compare calendar days, not hours
  final today = DateTime(now.year, now.month, now.day);
  final day = DateTime(date.year, date.month, date.day);

  final daysAgo = today.difference(day).inDays;

  // Monday is weekday 1, so this rolls back to Monday of this week
  final startOfThisWeek = today.subtract(Duration(days: today.weekday - 1));
  final startOfLastWeek = startOfThisWeek.subtract(const Duration(days: 7));

  if (daysAgo == 0) return 'Today';
  if (daysAgo == 1) return 'Yesterday';
  if (!day.isBefore(startOfThisWeek)) return 'This week';
  if (!day.isBefore(startOfLastWeek)) return 'Last week';
  if (day.year == today.year && day.month == today.month) return 'This month';
  if (day.year == today.year) return _months[day.month - 1];
  return '${_months[day.month - 1]} ${day.year}';
}