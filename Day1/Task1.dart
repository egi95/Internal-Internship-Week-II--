void main() {
  // Shembuj testimi
  List<double> nota1 = [7, 8.5, 10, 6];
  List<double> nota2 = [];
  List<double> nota3 = [5.5, 9.0, 8.25];

  print("Mesatarja 1: ${mesatarja(nota1).toStringAsFixed(2)}"); // 7.88
  print("Mesatarja 2: ${mesatarja(nota2).toStringAsFixed(2)}"); // 0.00
  print("Mesatarja 3: ${mesatarja(nota3).toStringAsFixed(2)}"); // 7.58
}

double mesatarja(List<double> nota) {
  if (nota.isEmpty) {
    return 0.0; // Nëse lista është bosh, kthe 0.0
  }

  double shuma = 0.0;
  for (double n in nota) {
    shuma += n; // Mblidhen të gjitha notat
  }

  return shuma / nota.length; // Kthehet mesatarja
}

