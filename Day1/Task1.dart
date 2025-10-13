// task1.dart

import 'dart:io';

/// Funksioni që llogarit mesataren e notave
double mesatarja(List<double> nota) {
  if (nota.isEmpty) {
    return 0.0;
  }

  double shuma = 0.0;
  for (double n in nota) {
    shuma += n;
  }

  return shuma / nota.length;
}

void main() {
  // Shembull liste notash
  List<double> notat = [7, 8.5, 10, 6];

  double rezultat = mesatarja(notat);

  // Printo me 2 shifra pas presjes
  print(rezultat.toStringAsFixed(2));

  // Shembull me listë bosh
  List<double> listaBosh = [];
  print(mesatarja(listaBosh).toStringAsFixed(2));
}
