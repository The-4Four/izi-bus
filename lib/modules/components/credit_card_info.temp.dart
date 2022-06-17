class CreditCardList {
  String name;
  String holder;
  String id;
  String validity;
  String securityCode;

  CreditCardList({
    required this.name,
    required this.holder,
    required this.id,
    required this.validity,
    required this.securityCode,
  });
}

List<CreditCardList> creditCards = [
  CreditCardList(
      name: "Banco do Brasil",
      holder: "DANIEL G FAVERO",
      id: "9999999999999999",
      validity: "0128",
      securityCode: "999"),
  CreditCardList(
      name: "Nubank Daniel",
      holder: "DANIEL G FAVERO",
      id: "9999999999999998",
      validity: "0129",
      securityCode: "999"),
];
