import 'package:flutter/material.dart';

import '../assets/colors.dart';
import 'models/home_datas.dart';

final backgroundColors = [miskyRose, lemonChiffan, aliceBlue, purple];

abstract class AppFunctions {
  static Color randomColor(int number) {
    final result = number ~/ backgroundColors.length;

    if (result.isEven) {
      return backgroundColors[0];
    } else if (result == 1) {
      return backgroundColors[1];
    } else if (result == 2) {
      return backgroundColors[2];
    }
    return backgroundColors[3];
  }

  static String calendarToApiCall(Calendar calendar) {
    if (calendar == Calendar.none) return '';
    const apiCall = '&when=';
    if (calendar == Calendar.hour) return '${apiCall}1h';
    if (calendar == Calendar.day) return '${apiCall}24h';
    if (calendar == Calendar.day7) return '${apiCall}7d';
    if (calendar == Calendar.day30) return '${apiCall}30d';
    return '';
  }

  static String languagesToApiCall(List<String> langs) {
    if (langs.isEmpty) return '';
    String result = '&lang=';
    for (int i = 0; i < langs.length; i++) {
      if (i != langs.length - 1) {
        result = '$result${langs[i]},';
      } else {
        result = result + langs[i];
      }
    }
    return result;
  }

  static String sourcesToApiCall(List<String> sources) {
    if (sources.isEmpty) return '';
    String result = '&sources=';
    for (int i = 0; i < sources.length; i++) {
      if (i != sources.length - 1) {
        result = '$result${sources[i]},';
      } else {
        result = result + sources[i];
      }
    }
    return result;
  }

  static String dateToPeriod(String? date) {
    if (date == null) return '';
    final fullDate = DateTime(int.parse(date.substring(0, 4)),
        int.parse(date.substring(5, 7)), int.parse(date.substring(8, 10)));

    final difference = DateTime.now().difference(fullDate).inDays;
    if (difference == 0) {
      return 'Today';
    } else if (difference == 1) {
      return 'Yesterday';
    } else if (difference <= 6) {
      return '$difference days ago';
    } else if (difference <= 13) {
      return 'a week ago';
    } else if (difference <= 27) {
      return '${difference ~/ 7} weeks ago';
    } else if (difference <= 60) {
      return 'a month ago';
    } else if (difference <= 359) {
      return '${difference ~/ 30} months ago';
    } else if (difference <= 729) {
      return 'a year ago';
    } else {
      return '${difference ~/ 365} years ago';
    }
  }
}
