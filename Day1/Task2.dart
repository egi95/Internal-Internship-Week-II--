// Task 2 – Ndarja e numrave në çift dhe tek
// Autor: [Vendos emrin tënd]
// Data: [Vendos datën]
// Përshkrimi: Program që ndan një listë me numra në çift dhe tek

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
  // Shembuj testimi
  List<int> lista1 = [1, 2, 3, 4, 5, 6];
  List<int> lista2 = [];
  List<int> lista3 = [2, 4, 6];
  List<int> lista4 = [1, 3, 5];

  Map<String, List<int>> rezultat1 = ndaj(lista1);
  Map<String, List<int>> rezultat2 = ndaj(lista2);
  Map<String, List<int>> rezultat3 = ndaj(lista3);
  Map<String, List<int>> rezultat4 = ndaj(lista4);

  print("Lista1 - Cift: ${rezultat1['cift']}, Tek: ${rezultat1['tek']}"); // Cift: [2,4,6], Tek: [1,3,5]
  print("Lista2 - Cift: ${rezultat2['cift']}, Tek: ${rezultat2['tek']}"); // Cift: [], Tek: []
  print("Lista3 - Cift: ${rezultat3['cift']}, Tek: ${rezultat3['tek']}"); // Cift: [2,4,6], Tek: []
  print("Lista4 - Cift: ${rezultat4['cift']}, Tek: ${rezultat4['tek']}"); // Cift: [], Tek: [1,3,5]
}
