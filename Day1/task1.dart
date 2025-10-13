// Funksioni që llogarit mesataren e notave
double mesatarja(List<double> nota) {
  // Kontrollon nëse lista është bosh
  if (nota.isEmpty) {
    return 0.0;
  }

  // Llogarit shumën e të gjitha notave
  double shuma = 0.0;
  for (double n in nota) {
    shuma += n;
  }

  // Mesatarja = shuma / numri i notave
  double mesatare = shuma / nota.length;

  // Kthen rezultatin me 2 shifra pas presjes
  return double.parse(mesatare.toStringAsFixed(2));
}

void main() {
  // Shembuj për testim
  List<double> nota1 = [7, 8.5, 10, 6];
  List<double> nota2 = [];
  List<double> nota3 = [9.2, 7.8, 8.4];

  print("Mesatarja e notave 1: ${mesatarja(nota1)}"); // 7.88
  print("Mesatarja e notave 2: ${mesatarja(nota2)}"); // 0.00
  print("Mesatarja e notave 3: ${mesatarja(nota3)}"); // 8.47
}

//List<double> nota → Kjo krijon një listë që mund të ruajë nota numerike, qofshin ato numra të plotë (int) ose numra me presje dhjetore (double).

//if (nota.isEmpty) → Ky kontroll verifikon nëse lista është bosh. Nëse nuk ka asnjë element, programi kthen 0.0, për të shmangur ndarjen me zero gjatë llogaritjes së mesatares.

//for (double n in nota) → Ky cikël for-in kalon një nga një të gjitha elementet e listës dhe i mbledh ato në variablën shuma, duke përgatitur të dhënat për llogaritjen e mesatares.

//mesatare = shuma / nota.length → Kjo është formula klasike për llogaritjen e mesatares: shuma e të gjithë notave ndarë me numrin e elementeve të listës.

//toStringAsFixed(2) → Kjo metodë formaton numrin duke ruajtur vetëm dy shifra pas presjes, që e bën rezultatin më të lexueshëm dhe të bukur për paraqitje.

//double.parse(...) → Funksioni toStringAsFixed kthen një tekst (String). double.parse e konverton sërish në numër `double
