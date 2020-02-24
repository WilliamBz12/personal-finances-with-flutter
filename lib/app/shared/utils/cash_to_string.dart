class CashToString {
  static convertInReais({double value}) {
    return "R\$ ${value.toStringAsFixed(2).replaceAll(".", ",")}";
  }
}
