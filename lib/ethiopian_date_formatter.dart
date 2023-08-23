import 'ethiopian_date_converter.dart';
import 'ethiopian_date_symbol.dart';
import 'model/ethiopian_date.dart';

class EthiopianDateFormatter {
  static int weekDays = 1;
  String pattern;
  final String locale;

  EthiopianDateFormatter(this.pattern, [this.locale = "en"]);

  String format(EthiopianDateTime ethiopianDate) {
    try {
      var weekDays =
          EthiopianDateConverter.convertToGregorianDate(ethiopianDate).weekday;

      weekDays = weekDays == 7 ? 0 : weekDays;
      String convertedString = pattern;

      convertedString = convertedString
          .replaceAll("hh", '${ethiopianDate.timeRange} ${ethiopianDate.hour}')
          .replaceAll("HH", '${ethiopianDate.timeRange} ${ethiopianDate.hour}')
          .replaceAll("h", '${ethiopianDate.timeRange} ${ethiopianDate.hour}')
          .replaceAll("H", '${ethiopianDate.timeRange} ${ethiopianDate.hour}')
          .replaceAll(
              "mm",
              ethiopianDate.minute > 9
                  ? '${ethiopianDate.minute}'
                  : '0${ethiopianDate.minute}')
          .replaceAll(
              "m",
              ethiopianDate.minute > 9
                  ? '${ethiopianDate.minute}'
                  : '0${ethiopianDate.minute}')
          .replaceAll(
              "dddd",
              ethiopianDate.day > 9
                  ? '${ethiopianDate.day}'
                  : '0${ethiopianDate.day}')
          .replaceAll(
              "ddd",
              ethiopianDate.day > 9
                  ? '${ethiopianDate.day}'
                  : '0${ethiopianDate.day}')
          .replaceAll(
              "dd",
              ethiopianDate.day > 9
                  ? '${ethiopianDate.day}'
                  : '0${ethiopianDate.day}')
          .replaceAll("d", '${ethiopianDate.day}')
          .replaceAll("d", '${ethiopianDate.day}')
          .replaceAll("d", '${ethiopianDate.day}')
          .replaceAll(
              "EEEE",
              EthiopianDateSymbol(locale)
                  .dateSymbols
                  .STANDALONEWEEKDAYS[weekDays])
          .replaceAll("EEE",
              EthiopianDateSymbol(locale).dateSymbols.SHORTWEEKDAYS[weekDays])
          .replaceAll("EE",
              EthiopianDateSymbol(locale).dateSymbols.SHORTWEEKDAYS[weekDays])
          .replaceAll("E",
              EthiopianDateSymbol(locale).dateSymbols.NARROWWEEKDAYS[weekDays])
          .replaceAll(
              "LLLL",
              EthiopianDateSymbol(locale)
                  .dateSymbols
                  .STANDALONEMONTHS[ethiopianDate.month - 1])
          .replaceAll(
              "LLL",
              EthiopianDateSymbol(locale)
                  .dateSymbols
                  .STANDALONESHORTMONTHS[ethiopianDate.month - 1])
          .replaceAll(
              "LL",
              EthiopianDateSymbol(locale)
                  .dateSymbols
                  .STANDALONESHORTMONTHS[ethiopianDate.month - 1])
          .replaceAll("yMMMMEEEEd",
              '${EthiopianDateSymbol(locale).dateSymbols.STANDALONEWEEKDAYS[weekDays]}, ${EthiopianDateSymbol(locale).dateSymbols.MONTHS[ethiopianDate.month - 1]}, ${ethiopianDate.day} ${ethiopianDate.year}')
          .replaceAll("yMMMM",
              '${EthiopianDateSymbol(locale).dateSymbols.MONTHS[ethiopianDate.month - 1]} ${ethiopianDate.year}')
          .replaceAll("yMMMd",
              '${EthiopianDateSymbol(locale).dateSymbols.SHORTMONTHS[ethiopianDate.month - 1]} ${ethiopianDate.day}, ${ethiopianDate.year}')
          .replaceAll(
              "yMMM", '${EthiopianDateSymbol(locale).dateSymbols.SHORTMONTHS[ethiopianDate.month - 1]} ${ethiopianDate.year}')
          .replaceAll(
              "yMEd", '${EthiopianDateSymbol(locale).dateSymbols.STANDALONEWEEKDAYS[weekDays]}, ${ethiopianDate.month}/${ethiopianDate.day}/${ethiopianDate.year}')
          .replaceAll(
              "yMd", '${ethiopianDate.month}/${ethiopianDate.day}/${ethiopianDate.year}')
          .replaceAll("yM", '${ethiopianDate.month}/${ethiopianDate.year}')
          .replaceAll("MMMMEEEEd",
              '${EthiopianDateSymbol(locale).dateSymbols.WEEKDAYS[weekDays]}, ${EthiopianDateSymbol(locale).dateSymbols.MONTHS[ethiopianDate.month - 1]} ${ethiopianDate.day}')
          .replaceAll("MMMMd",
              '${EthiopianDateSymbol(locale).dateSymbols.MONTHS[ethiopianDate.month - 1]} ${ethiopianDate.day}')
          .replaceAll("MMMd", '${EthiopianDateSymbol(locale).dateSymbols.SHORTMONTHS[ethiopianDate.month - 1]} ${ethiopianDate.day}')
          .replaceAll("MEd", '${EthiopianDateSymbol(locale).dateSymbols.SHORTWEEKDAYS[weekDays]}, ${ethiopianDate.month}/${ethiopianDate.day}')
          .replaceAll("Md", '${ethiopianDate.month}/${ethiopianDate.day}')
          .replaceAll('MMMM', EthiopianDateSymbol(locale).dateSymbols.MONTHS[ethiopianDate.month - 1])
          .replaceAll("MMM", EthiopianDateSymbol(locale).dateSymbols.SHORTMONTHS[ethiopianDate.month - 1])
          .replaceAll("MM", '${ethiopianDate.month}')
          .replaceAll("YYYY", '${ethiopianDate.year}')
          .replaceAll("yyyy", '${ethiopianDate.year}')
          .replaceAll("yyy", '${ethiopianDate.year}')
          .replaceAll("YYY", '${ethiopianDate.year}')
          .replaceAll("yy", '${ethiopianDate.year}'.substring(2))
          .replaceAll("YY", '${ethiopianDate.year}'.substring(2))
          .replaceAll("y", '${ethiopianDate.year}');
      return convertedString;
    } catch (ex, stack) {
      return "";
    }
  }
}
