class Student {
  String emri;
  List<double> nota;

  Student(this.emri, this.nota);

  double mesatarja() {
    if (nota.isEmpty) return 0.0;
    double shuma = nota.reduce((a, b) => a + b);
    return shuma / nota.length;
  }
}

void main() {
  // Lista e studentëve
  List<Student> studentet = [
    Student("Ana", [8, 9, 10]),
    Student("Ardit", [6, 7, 8]),
    Student("Besa", []), // Lista bosh
  ];

  Student? topStudent;
  double maxMesatare = -1.0;

  for (var student in studentet) {
    double mes = student.mesatarja();
    if (mes > maxMesatare) {
      maxMesatare = mes;
      topStudent = student;
    }
  }

  if (topStudent != null) {
    print("Top: ${topStudent.emri} - ${topStudent.mesatarja().toStringAsFixed(2)}");
  } else {
    print("Nuk ka studentë me nota.");
  }
}
