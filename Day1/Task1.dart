import 'dart:io';

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
  stdout.write("Shkruaj notat e ndara me hapësirë: ");
  String? input = stdin.readLineSync();

  // Nda tekstin dhe konverto në numra double
  List<double> nota = [];
  if (input != null && input.isNotEmpty) {
    nota = input.split(' ').map((e) => double.parse(e)).toList();
  }

  double mes = mesatarja(nota);
  print("Mesatarja: ${mes.toStringAsFixed(2)}");
}
