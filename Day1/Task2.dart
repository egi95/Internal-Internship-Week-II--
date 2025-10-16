Map<String, List<int>> ndaj(List<int> nums) {
  List<int> cift = [];
  List<int> tek = [];
  
  for (int numri in nums) {
    if (numri % 2 == 0) {
      cift.add(numri);
    } else {
      tek.add(numri);
    }
  }
  
  return {
    'cift': cift,
    'tek': tek,
  };
}

void main() {
  // Testimi me shembullin e dhënë
  List<int> numrat = [1, 2, 3, 4, 5, 6];
  Map<String, List<int>> rezultati = ndaj(numrat);
  print("Numrat: $numrat");
  print("Çift: ${rezultati['cift']}"); // Output: [2, 4, 6]
  print("Tek: ${rezultati['tek']}");   // Output: [1, 3, 5]
  print("");
  
  // Testimi me listë bosh
  List<int> bosh = [];
  Map<String, List<int>> rezultatiBosh = ndaj(bosh);
  print("Numrat: $bosh");
  print("Çift: ${rezultatiBosh['cift']}"); // Output: []
  print("Tek: ${rezultatiBosh['tek']}");   // Output: []
  print("");
  
  // Testimi me vetëm numra çift
  List<int> vetemCift = [2, 4, 6, 8, 10];
  Map<String, List<int>> rezultatiCift = ndaj(vetemCift);
  print("Numrat: $vetemCift");
  print("Çift: ${rezultatiCift['cift']}"); // Output: [2, 4, 6, 8, 10]
  print("Tek: ${rezultatiCift['tek']}");   // Output: []
  print("");
  
  // Testimi me vetëm numra tek
  List<int> vetemTek = [1, 3, 5, 7, 9];
  Map<String, List<int>> rezultatiTek = ndaj(vetemTek);
  print("Numrat: $vetemTek");
  print("Çift: ${rezultatiTek['cift']}"); // Output: []
  print("Tek: ${rezultatiTek['tek']}");   // Output: [1, 3, 5, 7, 9]
}
