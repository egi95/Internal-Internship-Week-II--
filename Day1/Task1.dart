double mesatarja(List<double> nota) {
  if (nota.isEmpty) {
    return 0.0;
  }

  double shuma = 0.0;
  for (double n in nota) {
    shuma += n;
  }

  return shuma / nota.length;
}

void main() {
  // Shembull notash (mund t’i ndryshosh)
  List<double> nota = [8.5, 9.0, 7.75, 10.0];

  double mes = mesatarja(nota);
  print("Notat: $nota");
  print("Mesatarja: ${mes.toStringAsFixed(2)}");
}
