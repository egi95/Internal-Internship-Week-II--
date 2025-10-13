void main() {
  List<double> nota = [7, 8.5, 10, 6];
  double rezultat = mesatarja(nota);

  print(rezultat.toStringAsFixed(2));
}

double mesatarja(List<double> nota) {
  if (nota.isEmpty) {
    return 0.0;
  }

  double shuma = 0.0;
  for (double n in nota) {
    shuma += n;
  }

  // Outputi
  return shuma / nota.length;
}
