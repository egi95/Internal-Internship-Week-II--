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
    Student('Arta', [9.0, 8.5, 10.0]),
    Student('Blerim', [7.0, 6.5, 8.0]),
    Student('Diona', [10.0, 9.5, 9.0])
  ];

  Student top = studentet[0];
  for (var s in studentet) {
    if (s.mesatarja() > top.mesatarja()) {
      top = s;
    }
  }

  print('Top: ${top.emri} - ${top.mesatarja().toStringAsFixed(2)}');
}
