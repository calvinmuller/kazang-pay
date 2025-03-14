DateTime startOfDay(DateTime date) {
  return DateTime(date.year, date.month, date.day, 0, 0, 0, 0, 0);
}

DateTime endOfDay(DateTime date) {
  return DateTime(date.year, date.month, date.day, 23, 59, 59, 999);
}