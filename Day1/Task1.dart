void main() {
 List<double> nota1 = [7, 8.5, 10, 6];
  double average1 = mesatarja(nota1);
  print("Mesatarja e [7, 8.5, 10, 6] eshte: ${average1.toStringAsFixed(2)}");

  List<double> nota2 = [];
  double average2 = mesatarja(nota2);
  print("Mesatarja e listes boshe eshte: ${average2.toStringAsFixed(2)}");

  List<double> nota3 = [7.5, 8.75, 9.25];
  double average3 = mesatarja(nota3);
  print("Mesatarja e [7.5, 8.75, 9.25] eshte: ${average3.toStringAsFixed(2)}");
}

double mesatarja(List<double> nota) {
  if (nota.isEmpty) {
    return 0.0;
  }

  double sum = 0.0;
  for (double note in nota) {
    sum += note;
  }
  return sum / nota.length;
}
