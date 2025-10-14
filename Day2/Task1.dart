class Student {
  String emri;
  List<double> nota;

  // Konstruktor
  Student(this.emri, this.nota);

  // Metoda që llogarit mesataren
  double mesatarja() {
    if (nota.isEmpty) return 0.0;
    double total = 0;
    for (var n in nota) {
      total += n;
    }
    return total / nota.length;
  }
}

void main() {
  // Lista e studentëve
  List<Student> studentet = [
    Student("Ana", [8, 9, 10]),
    Student("Ardit", [6, 7, 8]),
    Student("Blerina", []),
  ];

  // Gjetja e studentit me mesataren më të lartë
  Student topStudent = studentet[0];
  for (var s in studentet) {
    if (s.mesatarja() > topStudent.mesatarja()) {
      topStudent = s;
    }
  }

  // Printimi i rezultatit
  print("Top: ${topStudent.emri} - ${topStudent.mesatarja().toStringAsFixed(2)}");
}
