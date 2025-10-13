double mesatarja(List<double> nota) {
  if (nota.isEmpty) {
    return 0.0;
  }
  
  double shuma = 0.0;
  for (double not in nota) {
    shuma += not;
  }
  
  return shuma / nota.length;
}

void main() {
  // Testimi i detyruar sipas udhëzimeve
  print("=== Testimi i Detyrës 1 ===");
  
  // Test 1: Shembulli nga udhëzimet
  List<double> nota1 = [7, 8.5, 10, 6];
  double mesatarja1 = mesatarja(nota1);
  print("Notat: $nota1 → Mesatarja: ${mesatarja1.toStringAsFixed(2)}");
  
  // Test 2: Listë bosh
  List<double> nota2 = [];
  double mesatarja2 = mesatarja(nota2);
  print("Notat: $nota2 → Mesatarja: ${mesatarja2.toStringAsFixed(2)}");
  
  // Test 3: Vlera jo të plota (double)
  List<double> nota3 = [9.5, 8.25, 7.75, 10.0, 6.5];
  double mesatarja3 = mesatarja(nota3);
  print("Notat: $nota3 → Mesatarja: ${mesatarja3.toStringAsFixed(2)}");
  
  // Test 4: Numra të plotë
  List<double> nota4 = [5, 6, 7, 8, 9];
  double mesatarja4 = mesatarja(nota4);
  print("Notat: $nota4 → Mesatarja: ${mesatarja4.toStringAsFixed(2)}");
}
