void main() {
  
  List<int> lista1 = [1, 2, 3, 4, 5, 6];
  List<int> lista2 = [];
  List<int> lista3 = [2, 4, 8];
  List<int> lista4 = [1, 3, 5, 9];

  print("Shembulli 1: ${ndaj(lista1)}");
  print("Shembulli 2: ${ndaj(lista2)}");
  print("Shembulli 3: ${ndaj(lista3)}");
  print("Shembulli 4: ${ndaj(lista4)}");
}


Map<String, List<int>> ndaj(List<int> nums) {
  List<int> cift = [];
  List<int> tek = [];

  for (var n in nums) {
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
