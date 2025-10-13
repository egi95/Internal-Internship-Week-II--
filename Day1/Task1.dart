Task1
import 'dart:io';

double mesatarja(List<double> nota) {
  if (nota.isEmpty) return 0.0;

  double shuma = 0.0;
  for (var n in nota) {
    shuma += n;
  }
  return shuma / nota.length;
}

void main() {

  List<double> notat = [7, 8.5, 10, 6];

  double rezultati = mesatarja(notat);

 
  print(rezultati.toStringAsFixed(2));
}


Task 2 
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
 
