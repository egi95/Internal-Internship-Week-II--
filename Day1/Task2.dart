void main() {
  // Shembuj testimi
  List<int> lista1 = [1, 2, 3, 4, 5, 6];
  List<int> lista2 = [2, 4, 8];
  List<int> lista3 = [1, 3, 5];
  List<int> lista4 = [];

  print("Lista 1: ${ndaj(lista1)}");
  print("Lista 2: ${ndaj(lista2)}");
  print("Lista 3: ${ndaj(lista3)}");
  print("Lista 4: ${ndaj(lista4)}");
}

Map<String, List<int>> ndaj(List<int> nums) {
  List<int> cift = [];
  List<int> tek = [];

  // Përdorim i for-in dhe if
  for (int n in nums) {
    if (n % 2 == 0) {
      cift.add(n); // Nëse numri është çift, shto në listën cift
    } else {
      tek.add(n); // Përndryshe, shto në listën tek
    }
  }

  // Kthejmë një Map me dy lista
  return {
    'cift': cift,
    'tek': tek,
  };
}

