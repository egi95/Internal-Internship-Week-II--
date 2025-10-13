// task2.dart

Map<String, List<int>> ndaj(List<int> nums) {
  // Krijojme dy lista bosh per numrat çift dhe tek
  List<int> cift = [];
  List<int> tek = [];

  // Kontrollojme çdo numer ne liste me for-in
  for (var num in nums) {
    if (num % 2 == 0) {
      cift.add(num); // numer çift
    } else {
      tek.add(num); // numer tek
    }
  }

  // Kthejme nje harte (Map) me dy lista
  return {
    'cift': cift,
    'tek': tek,
  };
}

void main() {
  // Shembull testimi
  List<int> numrat = [1, 2, 3, 4, 5, 6];

  Map<String, List<int>> rezultat = ndaj(numrat);

  print('cift: ${rezultat['cift']}');
  print('tek: ${rezultat['tek']}');

  // Testim me liste bosh
  List<int> bosh = [];
  print('\nLista bosh:');
  print(ndaj(bosh));

  // Testim me vetem numra çift
  List<int> vetemCift = [2, 4, 6, 8];
  print('\nVetem numra çift:');
  print(ndaj(vetemCift));

  // Testim me vetem numra tek
  List<int> vetemTek = [1, 3, 5, 7];
  print('\nVetem numra tek:');
  print(ndaj(vetemTek));
}
