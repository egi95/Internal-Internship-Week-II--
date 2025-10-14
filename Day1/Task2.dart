void main() {
  List<int> numrat = [1, 2, 3, 4, 5, 6];

  List<int> cift = [];
  List<int> tek = [];

  if (numrat.isEmpty) {
    print("Lista është e zbrazet");
  } else {
    for (int n in numrat) {
      if (n % 2 == 0) {
        cift.add(n);
      } else {
        tek.add(n);
      }
    }

    print("cift: $cift");
    print("tek: $tek");
  }
}
