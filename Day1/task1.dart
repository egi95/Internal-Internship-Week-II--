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
  List<double> nota1 = [7, 8.5, 10, 6];
  List<double> nota2 = [];
  List<double> nota3 = [5.5, 7.25, 9.75];

  print(mesatarja(nota1).toStringAsFixed(2)); // 7.88
  print(mesatarja(nota2).toStringAsFixed(2)); // 0.00
  print(mesatarja(nota3).toStringAsFixed(2)); // 7.50
}
