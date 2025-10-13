// Funksioni që llogarit mesataren e notave
double mesatarja(List<double> nota) {
  // Nëse lista është bosh, kthen 0.0
  if (nota.isEmpty) {
    return 0.0;
  }

  // Llogarit shumën e të gjitha notave
  double shuma = 0.0;
  for (double n in nota) {
    shuma += n;
  }

  // Llogarit mesataren
  double mes = shuma / nota.length;
  return mes;
}

void main() {
  // Shembuj testimi:
  List<double> lista1 = [7, 8.5, 10, 6];
  List<double> lista2 = [];
  List<double> lista3 = [5.5, 6.25, 9.75];

  // Printim me 2 shifra pas presjes (formatuar)
  print('Mesatarja 1: ${mesatarja(lista1).toStringAsFixed(2)}'); // 7.88
  print('Mesatarja 2: ${mesatarja(lista2).toStringAsFixed(2)}'); // 0.00
  print('Mesatarja 3: ${mesatarja(lista3).toStringAsFixed(2)}'); // 7.17

nota.isEmpty → kontrollon nëse lista nuk ka elemente.

shuma += n; → shton çdo notë në total.

shuma / nota.length → llogarit mesataren.

.toStringAsFixed(2) → formon numrin me 2 shifra pas presjes dhjetore (p.sh. 7.88).
}
