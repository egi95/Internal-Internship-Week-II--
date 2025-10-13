// File: task1.dart
// Autori: Dardi Braha
// Përshkrimi: Program që llogarit mesataren e notave nga një listë.

double mesatarja(List<double> nota) {
  // Nëse lista është bosh, kthe 0.0
  if (nota.isEmpty) {
    return 0.0;
  }

  // Shuma e të gjitha notave
  double shuma = 0.0;

  for (double n in nota) {
    shuma += n;
  }

  // Kthe mesataren
  return shuma / nota.length;
}

void main() {
  // Shembuj testimi
  List<double> nota1 = [7, 8.5, 10, 6];
  List<double> nota2 = [];
  List<double> nota3 = [5.5, 9.0, 8.25];

  double mes1 = mesatarja(nota1);
  double mes2 = mesatarja(nota2);
  double mes3 = mesatarja(nota3);

  // Printo me dy shifra pas presjes
  print("Mesatarja 1: ${mes1.toStringAsFixed(2)}"); // 7.88
  print("Mesatarja 2: ${mes2.toStringAsFixed(2)}"); // 0.00
  print("Mesatarja 3: ${mes3.toStringAsFixed(2)}"); // 7.58
}
