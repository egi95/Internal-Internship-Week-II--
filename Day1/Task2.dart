Map<String, List<int>> ndaj(List<int> nums) {
  List<int> cifte = [];
  List<int> tek = [];

  for (int n in nums) {
    if (n % 2 == 0) {
      cifte.add(n);
    } else {
      tek.add(n);
    }
  }

  return {
    'cift': cifte,
    'tek': tek,
  };
}

void main() {
  List<int> numrat = [3, 8, 11, 24, 15, 6, 9, 10];

  Map<String, List<int>> rezultati = ndaj(numrat);

  print("Numrat çift: ${rezultati['cift']}");
  print("Numrat tek: ${rezultati['tek']}");
}
