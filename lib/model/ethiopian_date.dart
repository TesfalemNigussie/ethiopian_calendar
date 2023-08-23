class EthiopianDateTime extends DateTime {
  @override
  int month;
  @override
  int day;
  @override
  int year;
  @override
  int hour;
  @override
  int minute;
  @override
  int second;
  @override
  int millisecond;
  @override
  int microsecond;

  String timeRange;

  EthiopianDateTime(this.year, this.month, this.day,
      [this.hour = 0,
      this.minute = 0,
      this.second = 0,
      this.millisecond = 0,
      this.microsecond = 0,
      this.timeRange = ""])
      : super(DateTime.now().year) {
    if (day > 30 && month != 13) {
      day = 1;
      month++;
    }

    if (day > 6 && year % 4 == 3 && month == 13) {
      day = 1;
      month = 1;
      year++;
    }

    if (day > 5 && year % 4 != 3 && month == 13) {
      day = 1;
      month = 1;
      year++;
    }

    if (month > 13) {
      month = month % 13;
      year++;
    }
  }

  int get totalDaysInMonth => month == 13
      ? year % 4 == 3
          ? 6
          : 5
      : 30;

  List<EthiopianDateTime> get getAllDaysInMonth =>
      List<EthiopianDateTime>.generate(
        totalDaysInMonth,
        (i) => EthiopianDateTime(year, month, i + 1),
      );
}
