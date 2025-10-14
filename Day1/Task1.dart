void main() {
  List<double> nota1 = [7, 8.5, 10, 6];
  List<double> nota2 = [];
  List<double> nota3 = [9.5, 7.25, 8.75];
  print("Mesatarja 1: ${mesatarja(nota1).toStringAsFixed(2)}");
  print("Mesatarja 2: ${mesatarja(nota2).toStringAsFixed(2)}");
  print("Mesatarja 3: ${mesatarja(nota3).toStringAsFixed(2)}");
}
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
