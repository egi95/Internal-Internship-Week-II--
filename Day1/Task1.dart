// Task 1 – Llogaritja e mesatares së notave
// Autori: Daris Aliu
// Përshkrimi: Program që llogarit mesataren e notave nga një listë.
// Nëse lista është bosh, kthen 0.0 dhe printon rezultatin me 2 shifra pas presjes.

double mesatarja(List<double> nota) {
  if (nota.isEmpty) {
    return 0.0;
  }

  double shuma = 0;
  for (var n in nota) {
    shuma += n;
  }

  return shuma / nota.length;
}

void main() {
  // Shembuj për testim
  List<double> notat1 = [7, 8.5, 10, 6];
  List<double> notat2 = [];
  List<double> notat3 = [9.75, 8.25, 7.5];

  print("Mesatarja 1: ${mesatarja(notat1).toStringAsFixed(2)}"); // 7.88
  print("Mesatarja 2: ${mesatarja(notat2).toStringAsFixed(2)}"); // 0.00
  print("Mesatarja 3: ${mesatarja(notat3).toStringAsFixed(2)}"); // 8.50
}
