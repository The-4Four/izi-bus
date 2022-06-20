final digitRegex = RegExp(r'[0-9]');
final digitsRegex = RegExp(r'^[0-9]*$');
final validityDateRegex =
    RegExp(r'^(0[1-9]|1[0-2])\/?(([0-9]{2})|([0-9]{4})$)');
final integerRegex = RegExp(r'^\-\?[0-9]+$');
final realRegex = RegExp(r'^\-\?[0-9]+(\,\?[0-9]*)?$');

final currencyRegex =
    RegExp(r'(?=.*?\d)^\$?(([1-9]\d{0,2}(.\d{3})*)|\d+)?(\,\d{1,2})?$');
