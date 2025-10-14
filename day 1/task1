// task1.dart

double mesatarja(List<double> nota) {
  if (nota.isEmpty) return 0.0; // Nëse lista është bosh, kthen 0.0

  double shuma = 0.0;
  for (var n in nota) {
    shuma += n; // Shto çdo notë në shuma
  }

  return shuma / nota.length; // Kthe mesataren
}

void main() {
  List<double> notat = [7, 8.5, 10, 6]; // Shembull inputi

  double result = mesatarja(notat);

  // Printo me 2 shifra pas presjes
  print(result.toStringAsFixed(2)); // Output: 7.88
}
