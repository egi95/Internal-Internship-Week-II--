double mesatarja(List<double> nota) {
  if (nota.isEmpty) {
    return 0.0;
  }
  
  double shuma = 0.0;
  for (double note in nota) {
    shuma += note;
  }
  
  return shuma / nota.length;
}

void main() {
  // Test 1: Shembull inputi: [7, 8.5, 10, 6] → Output: 7.88
  List<double> nota1 = [7, 8.5, 10, 6];
  double mesatare1 = mesatarja(nota1);
  print("Mesatarja për $nota1: ${mesatare1.toStringAsFixed(2)}");
  
  // Test 2: Lista bosh → Output: 0.00
  List<double> nota2 = [];
  double mesatare2 = mesatarja(nota2);
  print("Mesatarja për listën bosh: ${mesatare2.toStringAsFixed(2)}");
  
  // Test 3: Vlera jo të plota (double)
  List<double> nota3 = [9.5, 8.25, 7.75, 10.0, 6.5];
  double mesatare3 = mesatarja(nota3);
  print("Mesatarja për $nota3: ${mesatare3.toStringAsFixed(2)}");
  
  // Test 4: Numra të plotë
  List<double> nota4 = [5, 6, 7, 8, 9];
  double mesatare4 = mesatarja(nota4);
  print("Mesatarja për $nota4: ${mesatare4.toStringAsFixed(2)}");
}
