// task2.dart
void main() {
  // Shembuj për testim
  List<int> lista1 = [1, 2, 3, 4, 5, 6];
  List<int> lista2 = [];
  List<int> lista3 = [2, 4, 8, 10];
  List<int> lista4 = [1, 3, 5, 7];

  print('Rezultati 1: ${ndaj(lista1)}');
  print('Rezultati 2: ${ndaj(lista2)}');
  print('Rezultati 3: ${ndaj(lista3)}');
  print('Rezultati 4: ${ndaj(lista4)}');
}

// Funksioni që ndan numrat në çift dhe tek
Map<String, List<int>> ndaj(List<int> nums) {
  // Krijojmë dy lista bosh
  List<int> cift = [];
  List<int> tek = [];

  // Kalojmë nëpër secilin numër të listës
  for (int n in nums) {
    if (n % 2 == 0) {
      cift.add(n); // numrat që pjestohen me 2 janë çift
    } else {
      tek.add(n); // numrat që nuk pjestohen me 2 janë tek
    }
  }

  // Kthejmë një Map me dy çelësa: 'cift' dhe 'tek'
  return {
    'cift': cift,
    'tek': tek,
  };
}
