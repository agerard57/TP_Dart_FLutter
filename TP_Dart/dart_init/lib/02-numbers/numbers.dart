num sum(int price1, double price2) {
  num result = price1 + price2;

  assert(result == price1 + price2);

  return result;
}

int convertToInt(int price1, double price2) {
  num nbSum = sum(price1, price2);
  return nbSum.toInt();
}

int strToInt(String intAsString) {
  return int.parse(intAsString);
}

Never sumFails() {
  throw ArgumentError('An error occurred');
}
