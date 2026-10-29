String getTimeOfDay() {
  final hour = DateTime.now().hour;
  if (hour <= 12) {
    return 'morning';
  }
  if (hour <= 18) {
    return 'afternoon';
  }
  return 'evening';
}