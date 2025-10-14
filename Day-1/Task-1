// task1.dart
import 'dart:io';

double mesatarja(List<double> nota) {
  if (nota.isEmpty) {
    return 0.0;
  }
  double shuma = 0.0;
  for (var n in nota) {
    shuma += n;
  }
  return shuma / nota.length;
}

void main() {
  // Shembull testimi
  List<double> nota = [7, 8.5, 10, 6];
  
  double rezultat = mesatarja(nota);
  print("Mesatarja: ${rezultat.toStringAsFixed(2)}");

  // Testim me liste bosh
  List<double> bosh = [];
  print("Mesatarja (liste bosh): ${mesatarja(bosh).toStringAsFixed(2)}");
}
