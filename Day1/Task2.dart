Map<String, List<int>> ndaj(List<int> nums) {
  List<int> cifte = [];
  List<int> tek = [];

  for (int n in nums) {
    if (n % 2 == 0) {
      cifte.add(n);
    } else {
      tek.add(n);
    }
  }

  return {'cift': cifte, 'tek': tek};
}

void main() {
  List<int> lista1 = [1, 2, 3, 4, 5, 6];
  List<int> lista2 = [];
  List<int> lista3 = [2, 4, 8];
  List<int> lista4 = [1, 3, 5, 7];

  print('Rezultati për lista1: ${ndaj(lista1)}'); // cift: [2, 4, 6], tek: [1, 3, 5]
  print('Rezultati për lista2: ${ndaj(lista2)}'); // cift: [], tek: []
  print('Rezultati për lista3: ${ndaj(lista3)}'); // cift: [2, 4, 8], tek: []
  print('Rezultati për lista4: ${ndaj(lista4)}'); // cift: [], tek: [1, 3, 5, 7]
}
