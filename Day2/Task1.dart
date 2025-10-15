// task1.dart

class Student {
  String emri;
  List<double> nota;

  Student(this.emri, this.nota);

  double mesatarja() {
    if (nota.isEmpty) return 0.0;
    double shuma = 0;
    for (var n in nota) {
      shuma += n;
    }
    return shuma / nota.length;
  }
}

void main() {
  List<Student> studentet = [
    Student('Ana', [8, 9, 10]),
    Student('Ardit', [6, 7, 8]),
    Student('Besa', []), // bosh për ta testuar
  ];

  Student top = studentet[0];
  for (var s in studentet) {
    if (s.mesatarja() > top.mesatarja()) {
      top = s;
    }
  }

  print('Top: ${top.emri} - ${top.mesatarja().toStringAsFixed(2)}');
}
