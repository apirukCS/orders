enum SortByPrice { NotSpecified, Descending, NotDescending }

extension ParseToString on SortByPrice {
  String enumToString() {
    return toString().split('.').last;
  }
}
