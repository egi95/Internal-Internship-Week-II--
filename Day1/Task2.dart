  // Task 2 – Ndarja e numrave në çift dhe tek
// Autori: Loris Ajazaj
// Përshkrimi: Program që ndan një listë me numra të plotë në dy lista: çift dhe tek.
// Përdor for-in dhe if. Kthen një hartë (Map) me çelësa 'cift' dhe 'tek'.

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

  return {'cift': cift, 'tek': tek};
}

void main() {
  // Shembuj për testim
  List<int> lista1 = [1, 2, 3, 4, 5, 6];
  List<int> lista2 = [];
  List<int> lista3 = [2, 4, 8, 10];
  List<int> lista4 = [1, 3, 5, 7];

  print("Rezultati 1: ${ndaj(lista1)}"); // cift: [2,4,6], tek: [1,3,5]
  print("Rezultati 2: ${ndaj(lista2)}"); // bosh
  print("Rezultati 3: ${ndaj(lista3)}"); // vetëm çift
  print("Rezultati 4: ${ndaj(lista4)}"); // vetëm tek
}
