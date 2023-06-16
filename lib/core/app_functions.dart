import 'package:flutter/material.dart';
import 'package:news_app/core/models/home_datas.dart';

import '../assets/colors.dart';

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
}
