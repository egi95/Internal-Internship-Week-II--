// File: task2.dart

Map<String, List<int>> ndaj(List<int> nums) {
  List<int> cift = [];
  List<int> tek = [];

  for (int num in nums) {
    if (num % 2 == 0) {
      cift.add(num);
    } else {
      tek.add(num);
    }
  }

  return {
    'cift': cift,
    'tek': tek,
  };
}

void main() {
  // Shembuj testimi
  List<int> lista1 = [1, 2, 3, 4, 5, 6];
  List<int> lista2 = [];
  List<int> lista3 = [2, 4, 8];
  List<int> lista4 = [1, 3, 5, 7];

  print("Lista 1: ${ndaj(lista1)}");
  print("Lista 2: ${ndaj(lista2)}");
  print("Lista 3: ${ndaj(lista3)}");
  print("Lista 4: ${ndaj(lista4)}");
}
