import 'dart:io';

double mesatarja(List<double> nota) {
  if (nota.isEmpty) return 0.0;
  double shuma = nota.reduce((a, b) => a + b);
  return shuma / nota.length;
}

void main() {
  // Shembuj testimi:
  List<double> shembull1 = [7, 8.5, 10, 6];
  List<double> bosh = [];
  List<double> shembull2 = [9.75, 7.25, 8.0];

  double m1 = mesatarja(shembull1);
  double m2 = mesatarja(bosh);
  double m3 = mesatarja(shembull2);

  print(m1.toStringAsFixed(2)); // Output: 7.88
  print(m2.toStringAsFixed(2)); // Output: 0.00
  print(m3.toStringAsFixed(2)); // Output: 8.33
}
