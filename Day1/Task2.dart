// Funksioni ndaj() ndan numrat në lista çift dhe tek
Map<String, List<int>> ndaj(List<int> nums) {
  // Inicializojmë listat bosh
  List<int> cift = [];
  List<int> tek = [];

  // Përdorim for-in për të kaluar çdo numër
  for (int n in nums) {
    if (n % 2 == 0) {
      cift.add(n);  // shto në listën e numrave çift
    } else {
      tek.add(n);   // shto në listën e numrave tek
    }
  }

  // Kthejmë një hartë me çelësa 'cift' dhe 'tek'
  return {'cift': cift, 'tek': tek};
}

void main() {
  // Shembuj testimi
  List<int> lista1 = [1, 2, 3, 4, 5, 6];
  List<int> lista2 = [];
  List<int> lista3 = [2, 4, 6];
  List<int> lista4 = [1, 3, 5];

  // Printim rezultatet
  print(ndaj(lista1)); // cift: [2,4,6], tek: [1,3,5]
  print(ndaj(lista2)); // cift: [], tek: []
  print(ndaj(lista3)); // cift: [2,4,6], tek: []
  print(ndaj(lista4)); // cift: [], tek: [1,3,5]
}
