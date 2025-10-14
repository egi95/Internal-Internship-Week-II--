void main() {
  List<int> numra1 = [1, 2, 3, 4, 5, 6];
  List<int> numra2 = [];
  List<int> numra3 = [2, 4, 6, 8];
  List<int> numra4 = [1, 3, 5, 7];

  print("Test 1: ${ndaj(numra1)}");
  print("Test 2: ${ndaj(numra2)}");
  print("Test 3: ${ndaj(numra3)}");
  print("Test 4: ${ndaj(numra4)}");

  var rezultat = ndaj(numra1);
  print("\nLista çift: ${rezultat['cift']}");
  print("Lista tek: ${rezultat['tek']}");
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
