// Funksioni që ndan numrat në çift dhe tek
Map<String, List<int>> ndaj(List<int> nums) {
  List<int> cift = [];
  List<int> tek = [];

  for (int num in nums) {
    if (num % 2 == 0) {
      cift.add(num); // shto në listën e çift
    } else {
      tek.add(num); // shto në listën e tek
    }
  }

  return {'cift': cift, 'tek': tek};
}

void main() {
  // Shembuj për testim
  List<int> lista1 = [1, 2, 3, 4, 5, 6];
  List<int> lista2 = [];
  List<int> lista3 = [2, 4, 6];
  List<int> lista4 = [1, 3, 5];

  Map<String, List<int>> rezultat1 = ndaj(lista1);
  Map<String, List<int>> rezultat2 = ndaj(lista2);
  Map<String, List<int>> rezultat3 = ndaj(lista3);
  Map<String, List<int>> rezultat4 = ndaj(lista4);

  print("Lista 1 → cift: ${rezultat1['cift']}, tek: ${rezultat1['tek']}");
  print("Lista 2 → cift: ${rezultat2['cift']}, tek: ${rezultat2['tek']}");
  print("Lista 3 → cift: ${rezultat3['cift']}, tek: ${rezultat3['tek']}");
  print("Lista 4 → cift: ${rezultat4['cift']}, tek: ${rezultat4['tek']}");
}
