// File: task2.dart

// Funksioni që ndan numrat në çift dhe tek
Map<String, List<int>> ndaj(List<int> nums) {
  // Krijojmë dy lista bosh për numrat çift dhe tek
  List<int> cift = [];
  List<int> tek = [];

  // Përdorim një for-in loop për çdo numër në listë
  for (int n in nums) {
    if (n % 2 == 0) {
      // Nëse pjesa e mbetur nga pjestimi me 2 është 0 → numër çift
      cift.add(n);
    } else {
      // Përndryshe është numër tek
      tek.add(n);
    }
  }

  // Kthejmë një Map me dy çelësa: 'cift' dhe 'tek'
  return {
    'cift': cift,
    'tek': tek,
  };
}

void main() {
  // Shembull testimi
  List<int> numrat = [1, 2, 3, 4, 5, 6];
  Map<String, List<int>> rezultat = ndaj(numrat);

  print("Numrat çift: ${rezultat['cift']}");
  print("Numrat tek: ${rezultat['tek']}");

  // Test 2: lista bosh
  List<int> bosh = [];
  print("\nLista bosh:");
  print(ndarje(bosh)); // duhet të kthejë: {cift: [], tek: []}

  // Test 3: vetëm numra tek
  List<int> vetemTek = [1, 3, 5, 7];
  print("\nVetëm numra tek:");
  print(ndarje(vetemTek)); // {cift: [], tek: [1, 3, 5, 7]}

  // Test 4: vetëm numra çift
  List<int> vetemCift = [2, 4, 6, 8];
  print("\nVetëm numra çift:");
  print(ndarje(vetemCift)); // {cift: [2, 4, 6, 8], tek: []}
}
