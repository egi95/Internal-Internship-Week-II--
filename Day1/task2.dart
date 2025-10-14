// task2.dart

// Funksioni që ndan numrat në dy lista: çift dhe tek
Map<String, List<int>> ndaj(List<int> nums) {
  // Krijojmë dy lista bosh për numrat çift dhe tek
  List<int> cift = [];
  List<int> tek = [];

  // Përdorim i ciklit for për të kontrolluar çdo numër
  for (int n in nums) {
    if (n % 2 == 0) {
      cift.add(n); // nëse numri është çift
    } else {
      tek.add(n); // nëse numri është tek
    }
  }

  // Kthejmë një hartë (Map) me çelësa 'cift' dhe 'tek'
  return {
    'cift': cift,
    'tek': tek,
  };
}

void main() {
  // Shembuj për testim
  List<int> lista1 = [1, 2, 3, 4, 5, 6];
  List<int> lista2 = [2, 4, 8, 10];
  List<int> lista3 = [1, 3, 5, 7];
  List<int> lista4 = [];

  // Testim dhe printim i rezultateve
  print("Lista 1 → ${ndaj(lista1)}");
  print("Lista 2 → ${ndaj(lista2)}");
  print("Lista 3 → ${ndaj(lista3)}");
  print("Lista 4 → ${ndaj(lista4)}");
}
//Funksioni ndaj() pranon një listë me numra të plotë (List<int>).

//Përmes një cikli for, kontrollon çdo numër:

//nëse është çift (n % 2 == 0), e shton në listën cift;

//përndryshe e shton në listën tek.

//Në fund, kthen një Map me dy çelësa: 'cift' dhe 'tek'.

//Përdorimi i print() shfaq qartë rezultatet në formatin {cift: [...], tek: [...]}.
