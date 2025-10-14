class Student {
  String emri;
  List<double> nota;

  // Konstruktor
  Student(this.emri, this.nota);

  // Metoda për të llogaritur mesataren
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
  var studentet = [
    Student("Arta", [9.0, 10.0, 8.5]),
    Student("Blerim", [7.5, 8.0, 9.0]),
    Student("Diona", [10.0, 9.5, 9.8]),
  ];

  // Gjetja e studentit me mesataren më të lartë
  Student top = studentet[0];
  for (var s in studentet) {
    if (s.mesatarja() > top.mesatarja()) {
      top = s;
    }
  }

  print("Top: ${top.emri} - ${top.mesatarja().toStringAsFixed(2)}");
}
