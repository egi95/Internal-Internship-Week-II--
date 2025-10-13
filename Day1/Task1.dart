import 'dart:math';

import 'package:flutter/material.dart';

double average(List<double> grade) {
  if (grade.isEmpty) {
    return 0.0;
  }
  double total = grade.reduce((a, b) => a + b);
  return total / grade.length;
}

void main() {
  List<double> notat1 = [7, 8.5, 10, 6];
  print("Mesatarja: ${average(notat1).toStringAsFixed(2)}");

  // Shembulli 2: Lista bosh
  List<double> notat2 = [];
  print("Mesatarja: ${average(notat2).toStringAsFixed(2)}"); 
  // Shembulli 3: Vetëm double
  List<double> notat3 = [9.2, 7.8, 6.5];
  print("Mesatarja: ${average(notat3).toStringAsFixed(2)}");
}
