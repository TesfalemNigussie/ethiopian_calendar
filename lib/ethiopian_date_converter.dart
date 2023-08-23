import 'dart:core';

import 'model/ethiopian_date.dart';
import 'model/ethiopian_month.dart';

class EthiopianDateConverter {
  static int year = 2000;
  static int month = 1;
  static int date = 0;
  static int weekDays = 1;

  static EthiopianDateTime convertToEthiopianDate(DateTime datetime) {
    weekDays = datetime.weekday;
    if (DateTime.january >= datetime.month ||
        datetime.month <= DateTime.september) {
      if (datetime.month != DateTime.september) {
        year = datetime.year - 8;
      } else if (datetime.month == DateTime.september &&
          (datetime.year % 4 + 1) != 0 &&
          datetime.day < 11) {
        year = datetime.year - 8;
      } else if (datetime.month == DateTime.september &&
          (datetime.year + 1) % 4 == 0 &&
          datetime.day < 12) {
        year = datetime.year - 8;
      } else {
        year = datetime.year - 7;
      }
    } else {
      year = datetime.year - 7;
    }

    var tempYear = year - 1;

    if (DateTime.january == datetime.month) {
      if (tempYear % 4 == 3) {
        if (datetime.day < 10) {
          month = 4;
          date = datetime.day + 31 - 10;
        } else {
          month = 5;
          date = datetime.day - 9;
        }
      } else {
        if (datetime.day < 9) {
          month = 4;
          date = datetime.day + 31 - 9;
        } else {
          month = 5;
          date = datetime.day - 8;
        }
      }
    } else if (DateTime.february == datetime.month) {
      if (tempYear % 4 == 3) {
        if (datetime.day < 10) {
          month = 5;
          date = datetime.day + 31 - 9;
        } else {
          month = 6;
          date = datetime.day - 8;
        }
      } else {
        if (datetime.day < 8) {
          month = 5;
          date = datetime.day + 31 - 8;
        } else {
          month = 6;
          date = datetime.day - 7;
        }
      }
    } else if (DateTime.march == datetime.month) {
      if (datetime.day < 10) {
        month = 6;
        date = datetime.day + 29 - 8;
      } else {
        month = 7;
        date = datetime.day - 9;
      }
    } else if (DateTime.april == datetime.month) {
      if (datetime.day < 9) {
        month = 7;
        date = datetime.day + 30 - 8;
      } else {
        month = 8;
        date = datetime.day - 8;
      }
    } else if (DateTime.may == datetime.month) {
      if (datetime.day < 9) {
        month = 8;
        date = datetime.day + 30 - 8;
      } else {
        month = 9;
        date = datetime.day - 8;
      }
    } else if (DateTime.june == datetime.month) {
      if (datetime.day < 8) {
        month = 9;
        date = datetime.day + 31 - 8;
      } else {
        month = 10;
        date = datetime.day - 7;
      }
    } else if (DateTime.july == datetime.month) {
      if (datetime.day < 8) {
        month = 10;
        date = datetime.day + 30 - 7;
      } else {
        month = 11;
        date = datetime.day - 7;
      }
    } else if (DateTime.august == datetime.month) {
      if (datetime.day < 7) {
        month = 11;
        date = datetime.day + 31 - 7;
      } else {
        month = 12;
        date = datetime.day - 6;
      }
    } else if (DateTime.september == datetime.month) {
      if (tempYear % 4 == 3) {
        if (datetime.day < 6) {
          month = 12;
          date = datetime.day + 31 - 6;
        } else {
          if (datetime.day <= 11) {
            month = 13;
            date = datetime.day - 5;
          } else {
            month = 1;
            date = datetime.day - 11;
          }
        }
      } else {
        if (datetime.day < 6) {
          month = 12;
          date = datetime.day + 31 - 6;
        } else {
          if (datetime.day <= 11) {
            month = 13;
            date = datetime.day - 5;
          } else {
            month = 1;
            date = datetime.day - 11;
          }
        }
      }
    } else if (DateTime.october == datetime.month) {
      if (tempYear % 4 == 3) {
        if (datetime.day < 12) {
          month = 1;
          date = datetime.day + 30 - 11;
        } else {
          month = 2;
          date = datetime.day - 11;
        }
      } else {
        if (datetime.day < 11) {
          month = 1;
          date = datetime.day + 30 - 10;
        } else {
          month = 2;
          date = datetime.day - 10;
        }
      }
    } else if (DateTime.november == datetime.month) {
      if (tempYear % 4 == 3) {
        if (datetime.day < 11) {
          month = 2;
          date = datetime.day + 31 - 11;
        } else {
          month = 3;
          date = datetime.day - 10;
        }
      } else {
        if (datetime.day < 10) {
          month = 2;
          date = datetime.day + 31 - 10;
        } else {
          month = 3;
          date = datetime.day - 9;
        }
      }
    } else if (DateTime.december == datetime.month) {
      if (tempYear % 4 == 3) {
        if (datetime.day < 11) {
          month = 3;
          date = datetime.day + 30 - 10;
        } else {
          month = 4;
          date = datetime.day - 10;
        }
      } else {
        if (datetime.day < 10) {
          month = 3;
          date = datetime.day + 30 - 9;
        } else {
          month = 4;
          date = datetime.day - 9;
        }
      }
    }

    String? timeRange;

    if ((datetime.hour >= 6 && datetime.hour < 18)) {
      if (datetime.hour == 6 || (datetime.hour >= 7 && datetime.hour <= 11)) {
        timeRange = "Tewat";
      } else {
        timeRange = "Qen";
      }
    } else {
      if (datetime.hour == 18 || (datetime.hour >= 18 && datetime.hour <= 23)) {
        timeRange = "Mata";
      } else {
        timeRange = "Lelit";
      }
    }

    int hour = datetime.hour;

    var input = DateTime(datetime.year, datetime.month, datetime.day,
        datetime.hour, datetime.minute, 0);

    var minDateMidNight =
        DateTime(datetime.year, datetime.month, datetime.day, 00, 00, 00);
    var maxDateMidNight =
        DateTime(datetime.year, datetime.month, datetime.day, 05, 59, 59);

    var minDateDay =
        DateTime(datetime.year, datetime.month, datetime.day, 06, 00, 00);
    var maxDateDay =
        DateTime(datetime.year, datetime.month, datetime.day, 18, 59, 59);

    var minDateNight =
        DateTime(datetime.year, datetime.month, datetime.day, 19, 00, 00);
    var maxDateNight =
        DateTime(datetime.year, datetime.month, datetime.day, 23, 59, 59);

    if (input.isAfter(minDateMidNight) && input.isBefore(maxDateMidNight)) {
      hour = hour + 6;
      date--;
    }
    if (input.isAfter(minDateDay) && input.isBefore(maxDateDay)) {
      hour = hour - 6;
    }
    if (input.isAfter(minDateNight) && input.isBefore(maxDateNight)) {
      hour = hour - 18;
    }

    if (hour == 0) hour = 12;

    EthiopianDateTime ethiopianDate = EthiopianDateTime(
        year,
        month,
        date,
        hour,
        datetime.minute,
        datetime.second,
        datetime.millisecond,
        datetime.microsecond,
        timeRange);
    return ethiopianDate;
  }

  static int gregorianMonth(int month, bool isLeap) {
    switch (month) {
      case 2:
        if (isLeap) {
          return 29;
        } else {
          return 28;
        }
      case 1:
      case 3:
      case 5:
      case 7:
      case 8:
      case 10:
      case 12:
        return 31;
      default:
        return 30;
    }
  }

  static calculateDayAndMonth(
      int currentMonth, int currentDate, int addedDate, bool isLeap) {
    int day = currentDate + addedDate;
    int gregorianMonthDates = gregorianMonth(currentMonth, isLeap);
    if (day <= gregorianMonthDates) {
      month = currentMonth;
      date = day;
    } else {
      month = currentMonth + 1;
      date = day - gregorianMonthDates;
    }
  }

  static DateTime convertToGregorianDate(DateTime datetime) {
    int addDays = 1;
    int tempMonth = 1;
    bool isLeapYear = (datetime.year - 1) % 4 == 3;

    if (EthiopianMonth.meskerem <= datetime.month &&
        datetime.month <= EthiopianMonth.tahsas) {
      year = datetime.year + 7;
    } else {
      year = datetime.year + 8;
    }

    //isLeapYear = (year +1) % 4 == 0;
    if (EthiopianMonth.meskerem == datetime.month) {
      tempMonth = 9;
      if (isLeapYear) {
        addDays = 11;
      } else {
        addDays = 10;
      }
    } else if (EthiopianMonth.tikimt == datetime.month) {
      tempMonth = 10;
      if (isLeapYear) {
        addDays = 11;
      } else {
        addDays = 10;
      }
    } else if (EthiopianMonth.hidar == datetime.month) {
      tempMonth = 11;
      if (isLeapYear) {
        addDays = 10;
      } else {
        addDays = 9;
      }
    } else if (EthiopianMonth.tahsas == datetime.month) {
      tempMonth = 12;
      if (isLeapYear) {
        addDays = 10;
      } else {
        addDays = 9;
      }
    } else if (EthiopianMonth.tir == datetime.month) {
      tempMonth = 1;
      if (isLeapYear) {
        addDays = 9;
      } else {
        addDays = 8;
      }
    } else if (EthiopianMonth.yakatit == datetime.month) {
      tempMonth = 2;
      if (isLeapYear) {
        addDays = 8;
      } else {
        addDays = 7;
      }
    } else if (EthiopianMonth.maggabit == datetime.month) {
      tempMonth = 3;
      addDays = 9;
    } else if (EthiopianMonth.miyazya == datetime.month) {
      tempMonth = 4;
      addDays = 8;
    } else if (EthiopianMonth.ginbot == datetime.month) {
      tempMonth = 5;
      addDays = 8;
    } else if (EthiopianMonth.sene == datetime.month) {
      tempMonth = 6;
      addDays = 7;
    } else if (EthiopianMonth.hamle == datetime.month) {
      tempMonth = 7;
      addDays = 7;
    } else if (EthiopianMonth.nehasa == datetime.month) {
      tempMonth = 8;
      addDays = 6;
    } else if (EthiopianMonth.pagume == datetime.month) {
      tempMonth = 9;
      addDays = 5;
    }
    calculateDayAndMonth(tempMonth, datetime.day, addDays, isLeapYear);
    DateTime gregorianDateTime = DateTime(year, month, date);
    return gregorianDateTime;
  }
}
