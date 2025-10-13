void main() {
  List<int> numrat = [1, 2, 3, 4, 5, 6];
  Map<String, List<int>> rezultati = ndaj(numrat);

  print('Numrat çift: ${rezultati['cift']}');
  print('Numrat tek: ${rezultati['tek']}');
}

Map<String, List<int>> ndaj(List<int> nums) {
  List<int> cift = [];
  List<int> tek = [];

  for (int num in nums) {
    if (num % 2 == 0) {
      cift.add(num);
    } else {
      tek.add(num);
    }
  }

  return {'cift': cift, 'tek': tek};
}
