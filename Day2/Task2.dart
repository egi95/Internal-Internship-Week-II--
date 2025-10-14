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

  return {'cift': cift, 'tek': tek};
}

void main() {
  // Test 1: Lista me numra të përzier
  List<int> lista1 = [1, 2, 3, 4, 5, 6];
  var rezultati1 = ndaj(lista1);
  print('cift: ${rezultati1['cift']}');
  print('tek: ${rezultati1['tek']}');

  // Test 2: Lista bosh
  List<int> lista2 = [];
  var rezultati2 = ndaj(lista2);
  print('cift: ${rezultati2['cift']}');
  print('tek: ${rezultati2['tek']}');

  // Test 3: Vetëm numra çift
  List<int> lista3 = [2, 4, 6, 8];
  var rezultati3 = ndaj(lista3);
  print('cift: ${rezultati3['cift']}');
  print('tek: ${rezultati3['tek']}');

  // Test 4: Vetëm numra tek
  List<int> lista4 = [1, 3, 5, 7];
  var rezultati4 = ndaj(lista4);
  print('cift: ${rezultati4['cift']}');
  print('tek: ${rezultati4['tek']}');
}
