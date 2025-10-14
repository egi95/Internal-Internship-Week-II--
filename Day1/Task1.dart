// Task 1 – Llogaritja e mesatares së notave
// Autor: [Vendos emrin tënd]
// Data: [Vendos datën]
// Përshkrimi: Program që llogarit mesataren e notave nga një listë

double mesatarja(List<double> nota) {
  if (nota.isEmpty) {
    return 0.0;
  }

  double shuma = 0;
  for (var n in nota) {
    shuma += n;
  }
  return shuma / nota.length;
}

void main() {
  // Shembuj testimi
  List<double> nota1 = [7, 8.5, 10, 6];
  List<double> nota2 = [];
  List<double> nota3 = [9.0, 8.75, 7.25];

  print("Mesatarja 1: ${mesatarja(nota1).toStringAsFixed(2)}"); // 7.88
  print("Mesatarja 2: ${mesatarja(nota2).toStringAsFixed(2)}"); // 0.00
  print("Mesatarja 3: ${mesatarja(nota3).toStringAsFixed(2)}"); // 8.33
}
