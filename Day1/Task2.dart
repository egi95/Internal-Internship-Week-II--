Map<String, List<int>> ndaj(List<int> nums) {
  List<int> cift = [];
  List<int> tek = [];

  for (var n in nums) {
    if (n % 2 == 0) {
      cift.add(n);
    } else {
      tek.add(n);
    }
  }

  return {'cift': cift, 'tek': tek};
}

void main() {
  List<int> numrat = [1, 2, 3, 4, 5, 6];

  var rezultati = ndaj(numrat);

  print('cift: ${rezultati['cift']}');
  print('tek: ${rezultati['tek']}');
}


