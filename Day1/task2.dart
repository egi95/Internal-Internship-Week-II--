Map<String, List<int>> ndaj(List<int> nums) {
  List<int> cift = [];
  List<int> tek = [];
  
  // Përdorim for-in dhe if për të ndarë numrat
  for (int numri in nums) {
    if (numri % 2 == 0) {
      cift.add(numri);
    } else {
      tek.add(numri);
    }
  }
  
  // Kthejmë hartën me dy listat
  return {
    'cift': cift,
    'tek': tek,
  };
}

void main() {
  // Testimi i detyruar sipas udhëzimeve
  print("=== Testimi i Detyrës 2 ===");
  
  // Test 1: Shembulli nga udhëzimet
  List<int> numrat1 = [1, 2, 3, 4, 5, 6];
  Map<String, List<int>> rezultati1 = ndaj(numrat1);
  print("Numrat: $numrat1");
  print("Çift: ${rezultati1['cift']}, Tek: ${rezultati1['tek']}");
  print("");
  
  // Test 2: Listë bosh
  List<int> numrat2 = [];
  Map<String, List<int>> rezultati2 = ndaj(numrat2);
  print("Numrat: $numrat2");
  print("Çift: ${rezultati2['cift']}, Tek: ${rezultati2['tek']}");
  print("");
  
  // Test 3: Vetëm numra çift
  List<int> numrat3 = [2, 4, 6, 8, 10];
  Map<String, List<int>> rezultati3 = ndaj(numrat3);
  print("Numrat: $numrat3");
  print("Çift: ${rezultati3['cift']}, Tek: ${rezultati3['tek']}");
  print("");
  
  // Test 4: Vetëm numra tek
  List<int> numrat4 = [1, 3, 5, 7, 9];
  Map<String, List<int>> rezultati4 = ndaj(numrat4);
  print("Numrat: $numrat4");
  print("Çift: ${rezultati4['cift']}, Tek: ${rezultati4['tek']}");
  print("");
  
  // Test 5: Numra me zero dhe negative
  List<int> numrat5 = [0, -1, -2, 3, -4];
  Map<String, List<int>> rezultati5 = ndaj(numrat5);
  print("Numrat: $numrat5");
  print("Çift: ${rezultati5['cift']}, Tek: ${rezultati5['tek']}");
}
