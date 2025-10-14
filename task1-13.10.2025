// task1.dart

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
  // Shembuj testimi
  List<double> nota1 = [7, 8.5, 10, 6];
  List<double> nota2 = [];
  List<double> nota3 = [9.5, 7.3, 8.0];

  print("Mesatarja 1: ${mesatarja(nota1).toStringAsFixed(2)}"); // Output: 7.88
  print("Mesatarja 2: ${mesatarja(nota2).toStringAsFixed(2)}"); // Output: 0.00
  print("Mesatarja 3: ${mesatarja(nota3).toStringAsFixed(2)}"); // Output: 8.27
}
