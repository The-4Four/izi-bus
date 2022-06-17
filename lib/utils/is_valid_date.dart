import 'package:izi_bus/utils/regex.dart';

bool isValidDate(String value) {
  return validityDateRegex.hasMatch(value);
}
