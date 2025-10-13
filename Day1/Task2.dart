Map<String, List<int>> ndaj(List<int> nums) {
  List<int> cift = [];
  List<int> tek = [];

  for (var num in nums) {
    if (num % 2 == 0) {
      cift.add(num);
    } else {
      tek.add(num);
    }
  }

  return {'cift': cift, 'tek': tek};
}

void main() {
  // Shembuj testimi:
  List<int> lista1 = [1, 2, 3, 4, 5, 6];
  List<int> bosh = [];
  List<int> vetemCift = [2, 4, 8, 10];
  List<int> vetemTek = [1, 3, 5, 7, 9];

  print(ndarDhePrinto(lista1));
  print(ndarDhePrinto(bosh));
  print(ndarDhePrinto(vetemCift));
  print(ndarDhePrinto(vetemTek));
}

String ndarDhePrinto(List<int> lista) {
  var rezultat = ndaj(lista);
  return 'cift: ${rezultat['cift']}, tek: ${rezultat['tek']}';
}
