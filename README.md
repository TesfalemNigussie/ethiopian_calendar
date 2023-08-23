# ethiopian_calender
A flutter package that helps to change Ethiopian calender to Gregorian calender and vice versa.
## Getting Started

This package contains functions to change  Ethiopian calender to Gregorian calender which accepts EthiopianDateTime and returns DateTime Object.
## Installation

To use this package, add ethiopian_calender as a [dependency in your pubspec.yaml file](https://flutter.dev/docs/development/packages-and-plugins/using-packages).

```bash
  ethiopian_calendar: ^0.0.2
```

## Usage/Examples

## Converter

```dart
import 'package:ethiopian_calendar/ethiopian_date_converter.dart';
```

Want to convert to Ethiopian Date? Call ```convertToEthiopianDate``` method, it will return a EthiopianDateTime Model

```dart
EthiopianDateConverter.convertToEthiopianDate(DateTime.now());
```

if you want vice versa, call ```convertToGregorianDate```

```dart
EthiopianDateConverter.convertToGregorianDate(EthiopianDateTime(2016,01,01));
```

## Formatter

To format a DateTime, create a EthiopianDateFormatter instance. These can be created using a set of commonly used skeletons taken from ICU/CLDR or using an explicit pattern. For details on the supported skeletons and patterns see [DateFormat](https://pub.dev/documentation/intl/latest/intl/DateFormat-class.html).

```dart
EthiopianDateFormatter("yyyy, MMM, dd").format(EthiopianDateTime(2016, 01, 01));
```

using other locals

```dart
EthiopianDateFormatter("yyyy, MMM, dd", "am").format(EthiopianDateTime(2016, 01, 01));
```

Supported locals are : Amharic(am), Tigrinya(ti), Oromifa(om), Somalia(so)


## Features

- Ethiopian calender to Gregorian calender converter
- Gregorian calender to Ethiopian calender converter
- Ethiopian DateTime Formatter


## Badges
[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://choosealicense.com/licenses/mit/)



## Authors

- [@TesfalemNigussie](https://github.com/TesfalemNigussie)
- [@bininebro](https://github.com/bininebro/)


## License

[MIT](https://choosealicense.com/licenses/mit/)

