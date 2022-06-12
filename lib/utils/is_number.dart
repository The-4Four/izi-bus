import 'package:izi_bus/utils/regex.dart';

bool isNumber(String value) {
  return realRegex.hasMatch(value);
}
