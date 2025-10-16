double mesatarja(List<double> nota) {
  if (nota.isEmpty) return 0.0;
  
  double shuma = 0.0;
  for (double n in nota) {
    shuma += n;
  }
  
  return shuma / nota.length;
}

void main() {
  // Testimi me shembullin e dhënë
  List<double> nota = [7, 8.5, 10, 6];
  double mesatare = mesatarja(nota);
  print("Mesatarja: ${mesatare.toStringAsFixed(2)}"); // Output: 7.88
  
  // Testimi me listë bosh
  List<double> notaBosh = [];
  double mesatareBosh = mesatarja(notaBosh);
  print("Mesatarja (bosh): ${mesatareBosh.toStringAsFixed(2)}"); // Output: 0.00
  
  // Testimi me vlera të tjera double
  List<double> nota2 = [9.5, 8.0, 7.5, 10.0, 6.5];
  double mesatare2 = mesatarja(nota2);
  print("Mesatarja 2: ${mesatare2.toStringAsFixed(2)}"); // Output: 8.30
}
