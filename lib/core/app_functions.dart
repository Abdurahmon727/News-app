import '../assets/colors.dart';

final colors = [miskyRose, lemonChiffan, aliceBlue];

abstract class AppFunctions {
  static randomColor(int number) {
    if (number.isEven) {
      return colors[0];
    }
    return colors[1];
  }
}
