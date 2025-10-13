import 'dart:io';

double mesatarja(List<double> nota) {
  if (nota.isEmpty) {
    return 0.0; // Lista bosh
  }
  double shuma = 0;
  for (var vlera in nota) {
    shuma += vlera;
  }
  return shuma / nota.length;
}

void main() {
  // Shembull inputi
  List<double> notat = [7, 8.5, 10, 6];

  // Llogaritja e mesatares
  double rezultat = mesatarja(notat);

  // Printimi me 2 shifra pas presjes
  print(rezultat.toStringAsFixed(2));

  // Shembull me lista bosh
  List<double> bosh = [];
  print(mesatarja(bosh).toStringAsFixed(2));

  // Shembull me vlera double
  List<double> notatDouble = [9.25, 7.5, 8.75];
  print(mesatarja(notatDouble).toStringAsFixed(2));
}
