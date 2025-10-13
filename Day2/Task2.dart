void main() {
  List<int> numrat = [1, 2, 3, 4, 5, 6];
  Map<String, List<int>> rezultat = ndaj(numrat);

  print("cift: ${rezultat['cift']}");
  print("tek: ${rezultat['tek']}");
}

Map<String, List<int>> ndaj(List<int> nums) {
  List<int> cift = [];
  List<int> tek = [];

  for (int n in nums) {
    if (n % 2 == 0) {
      cift.add(n);
    } else {
      tek.add(n);
    }
  }

  return {
    'cift': cift,
    'tek': tek,
  };
}
