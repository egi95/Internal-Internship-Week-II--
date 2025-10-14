// Funksioni që ndan numrat në çift dhe tek
Map<String, List<int>> ndaj(List<int> nums) {
  List<int> cift = [];
  List<int> tek = [];

  for (var num in nums) {
    if (num % 2 == 0) {
      cift.add(num);
    } else {
      tek.add(num);
    }
  }

  return {'cift': cift, 'tek': tek};
}

void main() {
  // Shembuj testimi
  List<int> lista1 = [1, 2, 3, 4, 5, 6];
  List<int> lista2 = [];
  List<int> lista3 = [2, 4, 6];
  List<int> lista4 = [1, 3, 5];

  // Testim me lista të ndryshme
  var rezultat1 = ndaj(lista1);
  var rezultat2 = ndaj(lista2);
  var rezultat3 = ndaj(lista3);
  var rezultat4 = ndaj(lista4);

  print("Lista 1 → Cift: ${rezultat1['cift']}, Tek: ${rezultat1['tek']}");
  print("Lista 2 → Cift: ${rezultat2['cift']}, Tek: ${rezultat2['tek']}");
  print("Lista 3 → Cift: ${rezultat3['cift']}, Tek: ${rezultat3['tek']}");
  print("Lista 4 → Cift: ${rezultat4['cift']}, Tek: ${rezultat4['tek']}");
}
