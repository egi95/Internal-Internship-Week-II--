void main() {
  // Test cases
  List<double> grades1 = [7, 8.5, 10, 6];
  List<double> grades2 = [];
  List<double> grades3 = [5.5, 7]; // Incomplete values

  print("Average 1: ${average(grades1).toStringAsFixed(2)}");
  print("Average 2: ${average(grades2).toStringAsFixed(2)}");
  print("Average 3: ${average(grades3).toStringAsFixed(2)}");
}

double average(List<double> grades) {
  if (grades.isEmpty) {
    return 0.0;
  }
  double sum = 0;
  for (double grade in grades) {
    sum += grade;
  }
  return sum / grades.length;
}
