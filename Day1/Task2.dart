void main () { 
  // Shembull inputi 
  List<int> numrat = [1,2,3,4,5,6,];
  Map<String, List<int>> resultati = ndaj (numrat);

  // Printimi i rezultateve 
  print("Numrat cift: ${rezultati ['cift']}");     
  print("Numrat tek:  ${rezultati ['tek']}");
} 

// Funksioni qe ndan numrat ne cift dhe tek 
Map<String, list<int>> nadaj(List<int> nums) {
  List<int> cift = [];
  list<int> tek = [];

  // Kalimi neper secilin numer 
  for (int n in nums) { 
    if (n % 2 == 0) {
      cift.add(n);
    } else { 
      tek.add(n);
    }
  }

  // Kthejme rezultatet si harte (Map)
  return {
    'cift': cift,
    'tek': tek,
  };
}




