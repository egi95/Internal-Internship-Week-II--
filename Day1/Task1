double mesatarja(List<double> nota) {
  // nese lista eshte bosh
  if (nota.isEmpty) {
    return 0.0; // kthej 0.0
  }

  double shuma = 0; // po mbledh notat
  for (double n in nota) {
    shuma += n; // shtoj secilen note
  }

  double mes = shuma / nota.length; // pjesetoj me numrin e notave
  return mes; // kthej mesataren
}

void main() {
  // po testoj disa raste
  List<double> nota1 = [7, 8.5, 10, 6];
  List<double> nota2 = [];
  List<double> nota3 = [9.3, 8.7, 7.5];

  // po i printoj me 2 shifra pas presjes
  print(mesatarja(nota1).toStringAsFixed(2)); // 7.88
  print(mesatarja(nota2).toStringAsFixed(2)); // 0.00
  print(mesatarja(nota3).toStringAsFixed(2)); // 8.50
}
