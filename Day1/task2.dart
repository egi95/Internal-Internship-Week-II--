// Funksioni që ndan listën në çift dhe tek
Map<String, List<int>> ndaj(List<int> nums) {
  // Krijojmë dy lista bosh: cift dhe tek
  List<int> cift = [];
  List<int> tek = [];

  // Kalojmë nëpër secilin numër të listës
  for (int n in nums) {
    if (n % 2 == 0) {
      cift.add(n); // numrat çift shtohen në listën cift
    } else {
      tek.add(n); // numrat tek shtohen në listën tek
    }
  }

  // Kthejmë një hartë (map) me çelësa 'cift' dhe 'tek'
  return {
    'cift': cift,
    'tek': tek
  };
}

void main() {
  // Shembuj testimi
  List<int> lista1 = [1, 2, 3, 4, 5, 6];
  List<int> lista2 = [2, 4, 6, 8];
  List<int> lista3 = [1, 3, 5, 7];
  List<int> lista4 = [];

  // Përdorim funksionin ndaj dhe printojmë rezultatet
  print("Lista 1: ${ndaj(lista1)}"); // cift: [2,4,6], tek: [1,3,5]
  print("Lista 2: ${ndaj(lista2)}"); // cift: [2,4,6,8], tek: []
  print("Lista 3: ${ndaj(lista3)}"); // cift: [], tek: [1,3,5,7]
  print("Lista 4: ${ndaj(lista4)}"); // cift: [], tek: []
}
//Krijimi i listave bosh

//List<int> cift = [] dhe List<int> tek = [] – këto lista do të ruajnë numrat përkatësisht çift dhe tek.

//Cikli for-in

//for (int n in nums) kalon secilin numër të listës nums.

//Kontrolli i paritetit me if

//if (n % 2 == 0) – kontrollon nëse numri është çift.

//cift.add(n) shton numrin në listën e numrave çift.

//else – nëse numri nuk është çift, shtohet në listën tek.

//Kthimi i hartës (Map)

//return {'cift': cift, 'tek': tek} – krijon një hartë ku çelësat janë 'cift' dhe 'tek', dhe vlerat janë listat përkatëse.

//Testimi i funksionit

//Funksioni mund të menaxhojë lista bosh, lista me vetëm numra çift ose tek, dhe printon rezultatet në mënyrë të qartë.
