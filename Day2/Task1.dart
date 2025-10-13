// task1.dart

double mesatarja(List<double> nota) {
  if (nota.isEmpty) {
    return 0.0;
  }
  double shuma = 0;
  for (double n in nota) {
    shuma += n;
  }
  return shuma / nota.length;
}

void main() {
  List<double> nota = [7, 8.5, 10, 6];
  double rezultat = mesatarja(nota);
  print("Mesatarja: ${rezultat.toStringAsFixed(2)}");
}
