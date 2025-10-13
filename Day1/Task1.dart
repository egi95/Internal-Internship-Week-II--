import 'dart:io';

double mesatarja(List<double> nota) {
  if (nota.isEmpty) return 0.0;
  double shuma = 0.0;
  for (double n in nota) {
    shuma += n;
  }
  return shuma / nota.length;
}

void main() {
  List<double> notat = [7, 8.5, 10, 6];
  print(mesatarja(notat).toStringAsFixed(2));

  List<double> bosh = [];
  print(mesatarja(bosh).toStringAsFixed(2));

  List<double> vleraDouble = [9.2, 8.5, 7.7];
  print(mesatarja(vleraDouble).toStringAsFixed(2));
}
