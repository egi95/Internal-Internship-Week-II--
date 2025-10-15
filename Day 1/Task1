double mesatarja(List<double> nota) {
  if (nota.isEmpty) {
    return 0.0;
  }

  double shuma = 0.0;
  for (var n in nota) {
    shuma += n;
  }

  double mesatare = shuma / nota.length;
  return double.parse(mesatare.toStringAsFixed(2));
}

void main() {
  print(mesatarja([7, 8.5, 10, 6]));
