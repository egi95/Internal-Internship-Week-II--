// task1.dart
// Autore: Altina Brahimi
// Qëllimi: Llogarit mesataren e notave me dy shifra pas presjes.

double mesatarja(List<double> nota) {
  if (nota.isEmpty) return 0.0; // nëse lista është bosh
  double shuma = 0.0;

  for (var n in nota) {
    shuma += n;
  }

  double mes = shuma / nota.length;
  return double.parse(mes.toStringAsFixed(2)); // 2 shifra pas presjes
}

void main() {
  // Shembuj testimi:
  List<double> lista1 = [7, 8.5, 10, 6];
  List<double> lista2 = [];
  List<double> lista3 = [9.25, 8.75, 10];

  print("Mesatarja e listës 1: ${mesatarja(lista1)}"); // 7.88 ✅
  print("Mesatarja e listës 2: ${mesatarja(lista2)}"); // 0.00 ✅
  print("Mesatarja e listës 3: ${mesatarja(lista3)}"); // 9.33 ✅
}
