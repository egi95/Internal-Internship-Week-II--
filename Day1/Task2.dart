// task2.dart

// Funksioni që ndan numrat në çift dhe tek
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

void main() {
  // Shembull 1: Listë normale
  List<int> numrat1 = [1, 2, 3, 4, 5, 6];
  var rezultati1 = ndaj(numrat1);
  print('cift: ${rezultati1['cift']}'); // [2, 4, 6]
  print('tek: ${rezultati1['tek']}');   // [1, 3, 5]

  // Shembull 2: Listë bosh
  List<int> numrat2 = [];
  var rezultati2 = ndaj(numrat2);
  print('cift: ${rezultati2['cift']}'); // []
  print('tek: ${rezultati2['tek']}');   // []

  // Shembull 3: Vetëm numra tek
  List<int> numrat3 = [1, 3, 5, 7];
  var rezultati3 = ndaj(numrat3);
  print('cift: ${rezultati3['cift']}'); // []
  print('tek: ${rezultati3['tek']}');   // [1, 3, 5, 7]

  // Shembull 4: Vetëm numra çift
  List<int> numrat4 = [2, 4, 6, 8];
  var rezultati4 = ndaj(numrat4);
  print('cift: ${rezultati4['cift']}'); // [2, 4, 6, 8]
  print('tek: ${rezultati4['tek']}');   // []
}
