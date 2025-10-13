// task1.dart
double mesatarja(List<double> nota) {
  // Nëse lista është bosh, kthen 0.0
  if (nota.isEmpty) {
    return 0.0;
  }

  // Llogarit shumën e notave
  double shuma = 0;
  for (double n in nota) {
    shuma += n;
  }

  // Llogarit mesataren
  double mes = shuma / nota.length;
  return mes;
}

void main() {
  // Shembuj për testim
  List<double> nota1 = [7, 8.5, 10, 6];
  List<double> nota2 = [];
  List<double> nota3 = [9.2, 7.8, 8.4];

  // Printo rezultatet me 2 shifra pas presjes
  print("Mesatarja 1: ${mesatarja(nota1).toStringAsFixed(2)}"); // 7.88
  print("Mesatarja 2: ${mesatarja(nota2).toStringAsFixed(2)}"); // 0.00
  print("Mesatarja 3: ${mesatarja(nota3).toStringAsFixed(2)}"); // 8.47
}
