import 'package:izi_bus/utils/regex.dart';

bool isValidCurrency(String value) {
  return currencyRegex.hasMatch(value);
}
