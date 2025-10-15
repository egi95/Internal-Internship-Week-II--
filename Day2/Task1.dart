class Student {
  String emri;
  List<double> nota;

  // Konstruktor
  Student(this.emri, this.nota);

  // Metoda për llogaritjen e mesatares
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
  // Krijojmë disa studentë
  List<Student> studentet = [
    Student("Ana", [8, 9, 10]),
    Student("Ardit", [6, 7, 8]),
    Student("Besa", []), // Lista bosh për test
  ];

  // Gjejmë studentin me mesataren më të lartë
  Student topStudent = studentet[0];
  for (var s in studentet) {
    if (s.mesatarja() > topStudent.mesatarja()) {
      topStudent = s;
    }
  }

  // Printojmë rezultatin
  print("Top: ${topStudent.emri} - ${topStudent.mesatarja().toStringAsFixed(2)}");
}

