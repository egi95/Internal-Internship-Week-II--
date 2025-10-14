// task1.dart

class Student {
  String emri;
  List<double> nota;

  // Konstruktor
  Student(this.emri, this.nota);

  // Metoda për llogaritjen e mesatares
  double mesatarja() {
    if (nota.isEmpty) return 0.0;
    double shuma = 0.0;
    for (var n in nota) {
      shuma += n;
    }
    return shuma / nota.length;
  }
}

void main() {
  // Lista e studentëve
  List<Student> studentet = [
    Student('Ana', [8, 9, 10]),
    Student('Ardit', [6, 7, 8]),
    Student('Blerina', []) // Lista bosh
  ];

  // Gjej studentin me mesataren më të lartë
  Student top = studentet[0];
  for (var s in studentet) {
    if (s.mesatarja() > top.mesatarja()) {
      top = s;
    }
  }

  // Printo rezultatin me 2 shifra pas presjes
  print('Top: ${top.emri} - ${top.mesatarja().toStringAsFixed(2)}');
}
