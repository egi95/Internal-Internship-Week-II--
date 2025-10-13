import 'dart:math';

import 'package:flutter/material.dart';

void main() {

  print(ndaj([1, 2, 3, 4, 5, 6]));
  print(ndaj([]));
  print(ndaj([2, 4, 6, 8]));
  print(ndaj([1, 3, 5, 7]));
}

Map<String, List<int>> ndaj(List<int> nums) {
  List<int> cift = [];
  List<int> tek = [];

  for (int num in nums) {
    if (num % 2 == 0) {
      cift.add(num);
    } else {
      tek.add(num);
    }
  }

  // Printimi i listave
  print('cift: $cift');
  print('tek: $tek');

  return {
    'cift': cift,
    'tek': tek,
  };
}
