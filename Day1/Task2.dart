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

  return {
    'cift': cift,
    'tek': tek,
  };
}

void main() {
  List<int> numrat = [1, 2, 3, 4, 5, 6];

  Map<String, List<int>> rezultat = ndaj(numrat);

  print('cift: ${rezultat['cift']}');
  print('tek: ${rezultat['tek']}');

  List<int> bosh = [];
  print('\nLista bosh:');
  print(ndaj(bosh));

  List<int> vetemCift = [2, 4, 6, 8];
  print('\nVetem numra çift:');
  print(ndaj(vetemCift));

  List<int> vetemTek = [1, 3, 5, 7];
  print('\nVetem numra tek:');
  print(ndaj(vetemTek));
}
