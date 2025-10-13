double mesatarja(List<double> nota) {
  if (nota.isEmpty) {
    return 0.0;
  }

  double shuma = 0;
  for (var n in nota) {
    shuma += n;
  }

  return shuma / nota.length;
}

void main() {
  List<double> nota1 = [7, 8.5, 10, 6];
  List<double> nota2 = [];
  List<double> nota3 = [9.2, 7.5, 8.8];

  print(mesatarja(nota1).toStringAsFixed(2)); // Output: 7.88
  print(mesatarja(nota2).toStringAsFixed(2)); // Output: 0.00
  print(mesatarja(nota3).toStringAsFixed(2)); // Output: 8.50
}

