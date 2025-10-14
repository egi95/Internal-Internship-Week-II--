Map<String, List<int>> ndaj(List<int> nums) {
  // Krijojmë listat bosh për numrat çift dhe tek
  List<int> cifte = [];
  List<int> tek = [];

  // Kalojmë nëpër çdo numër në listë
  for (int n in nums) {
    if (n % 2 == 0) {
      cifte.add(n);
    } else {
      tek.add(n);
    }
  }

  // Kthejmë një hartë (Map) me dy çelësa: 'cift' dhe 'tek'
  return {
    'cift': cifte,
    'tek': tek,
  };
}

void main() {
  // Shembull liste me numra
  List<int> numrat = [3, 8, 11, 24, 15, 6, 9, 10];

  // Thërrasim funksionin ndaj()
  Map<String, List<int>> rezultati = ndaj(numrat);

  // Printojmë rezultatet
  print("Numrat çift: ${rezultati['cift']}");
  print("Numrat tek: ${rezultati['tek']}");
}

