// File: task1.dart

// Funksioni që llogarit mesataren e një liste notash
double mesatarja(List<double> nota) {
  // Nëse lista është bosh, kthe 0.0
  if (nota.isEmpty) {
    return 0.0;
  }

  // Përdorim një variabël për shumën totale
  double shuma = 0;

  // Për çdo notë në listë, shtoje në shumën totale
  for (double n in nota) {
    shuma += n;
  }

  // Llogarit mesataren
  double rezultat = shuma / nota.length;

  // Kthe rezultatin
  return rezultat;
}

void main() {
  // Shembull 1: lista me vlera të përziera (int + double)
  List<double> nota1 = [7, 8.5, 10, 6];
  double mes1 = mesatarja(nota1);
  print(mes1.toStringAsFixed(2)); // Output: 7.88

  // Shembull 2: lista bosh
  List<double> nota2 = [];
  double mes2 = mesatarja(nota2);
  print(mes2.toStringAsFixed(2)); // Output: 0.00

  // Shembull 3: me vlera jo të plota
  List<double> nota3 = [5.5, 6.3, 7.8];
  double mes3 = mesatarja(nota3);
  print(mes3.toStringAsFixed(2)); // Output: 6.53
}
