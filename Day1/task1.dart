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

  double mes = mesatarja(notat);


  print(mes.toStringAsFixed(2));

  List<double> bosh = [];
  print(mesatarja(bosh).toStringAsFixed(2));


  List<double> vleraDouble = [5.5, 6.25, 9.75];
  print(mesatarja(vleraDouble).toStringAsFixed(2));
}
