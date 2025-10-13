// task1.dart
void main() {
  // Shembuj për testim
  List<double> nota1 = [7, 8.5, 10, 6];
  List<double> nota2 = [];
  List<double> nota3 = [9.2, 7.8, 8.0];

  print('Mesatarja 1: ${mesatarja(nota1).toStringAsFixed(2)}');
  print('Mesatarja 2: ${mesatarja(nota2).toStringAsFixed(2)}');
  print('Mesatarja 3: ${mesatarja(nota3).toStringAsFixed(2)}');
}

// Funksioni që llogarit mesataren e notave
double mesatarja(List<double> nota) {
  if (nota.isEmpty) {
    return 0.0; // Kthen 0.0 nëse lista është bosh
  }

  double shuma = 0;
  for (double n in nota) {
    shuma += n;
  }

  return shuma / nota.length;
}
