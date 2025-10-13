void main() {
  List<double> nota = [7, 8.5, 10, 6];
  double rezultat = mesatarja(nota);

  // Printo mesataren me 2 shifra pas presjes
  print(rezultat.toStringAsFixed(2));
}

double mesatarja(List<double> nota) {
  // Nëse lista është bosh → kthe 0.0
  if (nota.isEmpty) {
    return 0.0;
  }

  // Llogarit shumën e notave
  double shuma = 0.0;
  for (double n in nota) {
    shuma += n;
  }

  // Kthe mesataren
  return shuma / nota.length;
}
