void main() {
  List<double> nota = [7, 8.5, 10, 6];
  print(mesatarja(nota).toStringAsFixed(2));
}

double mesatarja(List<double> nota) {
  if (nota.isEmpty) return 0.0;
  double shuma = 0;
  for (var n in nota) {
    shuma += n;
  }
  return shuma / nota.length;
}
