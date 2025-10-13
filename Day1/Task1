// Funksioni që llogarit mesataren e notave
double mesatarja(List<double> nota) {
  if (nota.isEmpty) {
    return 0.0; // nëse lista është bosh, kthen 0.0
  }

  double shuma = 0.0;

  // Mbledh të gjitha notat
  for (double n in nota) {
    shuma += n;
  }

  // Llogarit mesataren
  return shuma / nota.length;
}

void main() {
  // Shembull 1: lista normale me nota
  List<double> nota1 = [7, 8.5, 10, 6];
  double mes1 = mesatarja(nota1);
  print("Mesatarja: ${mes1.toStringAsFixed(2)}"); // Output: 7.88

  // Shembull 2: lista bosh
  List<double> nota2 = [];
  double mes2 = mesatarja(nota2);
  print("Mesatarja: ${mes2.toStringAsFixed(2)}"); // Output: 0.00

  // Shembull 3: me vlera double (jo të plota)
  List<double> nota3 = [9.25, 8.75, 10];
  double mes3 = mesatarja(nota3);
  print("Mesatarja: ${mes3.toStringAsFixed(2)}"); // Output: 9.33
}
