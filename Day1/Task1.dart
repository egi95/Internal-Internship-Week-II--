import 'dart:io';

// Funksioni që llogarit mesataren e notave
double mesatarja(List<double> nota) {
  if (nota.isEmpty) {
    return 0.0; // nëse lista është bosh, kthen 0.0
  }

  double shuma = 0;
  for (double n in nota) {
    shuma += n; // shton çdo notë në shumë
  }

  return shuma / nota.length; // kthen mesataren
}

void main() {
  // Shembuj për testim
  List<double> nota1 = [7, 8.5, 10, 6];
  List<double> nota2 = [];
  List<double> nota3 = [9.5, 8.25, 7.75];

  print("Mesatarja 1: ${mesatarja(nota1).toStringAsFixed(2)}");
  print("Mesatarja 2: ${mesatarja(nota2).toStringAsFixed(2)}");
  print("Mesatarja 3: ${mesatarja(nota3).toStringAsFixed(2)}");
}
