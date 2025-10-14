// File: task1.dart

import 'dart:io';

double mesatarja(List<double> nota) {
  if (nota.isEmpty) return 0.0;

  double sum = 0.0;
  for (double n in nota) {
    sum += n;
  }

  return sum / nota.length;
}


void main() {
  // Example usage:
  List<double> notat = [7, 8.5, 10, 6];

  double avg = mesatarja(notat);

  // Print with 2 decimal places
  print(avg.toStringAsFixed(2));

  // Optional: test with empty list
  List<double> bosh = [];
  print(mesatarja(bosh).toStringAsFixed(2));
}
