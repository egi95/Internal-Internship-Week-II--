// task1.dart

// Funksioni që llogarit mesataren e një liste me nota
double mesatarja(List<double> nota) {
  if (nota.isEmpty) {
    return 0.0; // nëse lista është bosh
  }

  double shuma = 0.0;
  for (var n in nota) {
    shuma += n;
  }

  return shuma / nota.length;
}

void main() {
  // Shembull 1: Lista me nota
  List<double> notat1 = [7, 8.5, 10, 6];
  double rezultat1 = mesatarja(notat1);
  print(rezultat1.toStringAsFixed(2)); // Output: 7.88

  // Shembull 2: Lista bosh
  List<double> notat2 = [];
  double rezultat2 = mesatarja(notat2);
  print(rezultat2.toStringAsFixed(2)); // Output: 0.00

  // Shembull 3: Me vlera jo të plota
  List<double> notat3 = [9.25, 7.75, 8.5];
  double rezultat3 = mesatarja(notat3);
  print(rezultat3.toStringAsFixed(2)); // Output: 8.50
}
