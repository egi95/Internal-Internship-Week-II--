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

  return {
    'cift': cift,
    'tek': tek,
  };
}

void main() {

  List<int> lista1 = [1, 2, 3, 4, 5, 6];
  var rezultat1 = ndaj(lista1);
  print('Lista: $lista1');
  print('Çift: ${rezultat1['cift']}, Tek: ${rezultat1['tek']}');


  List<int> bosh = [];
  var rezultatBosh = ndaj(bosh);
  print('Lista bosh → Çift: ${rezultatBosh['cift']}, Tek: ${rezultatBosh['tek']}');

  List<int> tekVetem = [1, 3, 5];
  var rezultatTek = ndaj(tekVetem);
  print('Vetëm tek → Çift: ${rezultatTek['cift']}, Tek: ${rezultatTek['tek']}');

  List<int> ciftVetem = [2, 4, 6];
  var rezultatCift = ndaj(ciftVetem);
  print('Vetëm çift → Çift: ${rezultatCift['cift']}, Tek: ${rezultatCift['tek']}');
}
