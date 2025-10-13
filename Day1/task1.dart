// task1.dart
// Autori: Noela Plakiqi
// Përshkrimi: Program që llogarit mesataren e notave në Dart

// Funksioni që llogarit mesataren
double mesatarja(List<double> nota) {
  // Kontrollo nëse lista është bosh
  if (nota.isEmpty) {
    return 0.0;
  }

  // Llogarit shumën e të gjitha notave
  double shuma = 0.0;
  for (double n in nota) {
    shuma += n;
  }

  // Kthe mesataren
  return shuma / nota.length;
}

void main() {
  // Shembuj testimi
  List<double> nota1 = [7, 8.5, 10, 6];
  List<double> nota2 = [];
  List<double> nota3 = [9.2, 7.8, 8.0, 9.5];

  // Printimi i rezultateve me dy shifra pas presjes
  print("Mesatarja e notave (1): ${mesatarja(nota1).toStringAsFixed(2)}");
  print("Mesatarja e notave (2): ${mesatarja(nota2).toStringAsFixed(2)}");
  print("Mesatarja e notave (3): ${mesatarja(nota3).toStringAsFixed(2)}");
}


Shpjegim i shkurtër
Funksioni mesatarja() pranon një listë me vlera double.
Nëse lista është bosh → kthen 0.0.
Nëse ka nota, përdor një cikël for për të llogaritur shumën totale dhe e ndan me gjatësinë e listës.
toStringAsFixed(2) siguron që rezultati të shfaqet me dy shifra pas presjes.
