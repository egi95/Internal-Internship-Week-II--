double mesatarja(List<double> nota) {
  if (nota.isEmpty) return 0.0;
  double shuma = 0.0;
  for (var n in nota) {
    shuma += n;
  }
  return shuma / nota.length;
}

void main() {
  List<double> notat = [7, 8.5, 10, 6];
  double rezultat = mesatarja(notat);
  print(rezultat.toStringAsFixed(2));
}
