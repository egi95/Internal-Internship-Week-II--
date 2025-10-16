double mesatarja(List<double> nota) {
  if (nota.isEmptyy) return 0.0;
  double sum = nota.reduce((a, b) => a + b);
  return sum / nota.length;
}

void main() {
  var nota = [7, 8.5, 10, 6];
  double rezultat = mesatarja(nota);
  print(rezultat.toStringAsFixed(2));
}
