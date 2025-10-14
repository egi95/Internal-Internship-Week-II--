class Student {
  String emri;
  List<double> nota;

  // Konstruktor
  Student(this.emri, this.nota);

  // Metodë për llogaritjen e mesatares
  double mesatarja() {
    if (nota.isEmpty) {
      return 0.0;
    }
    double shuma = nota.reduce((a, b) => a + b);
    return shuma / nota.length;
  }
}

void main() {
  // Krijimi i listës së studentëve
  List<Student> studentet = [
    Student('Ana', [8, 9, 10]),
    Student('Ardit', [6, 7, 8]),
    Student('Beni', []), // Student me listë bosh
  ];

  // Gjetja e studentit me mesataren më të lartë
  Student topStudent = studentet[0];
  double maxMesatarja = topStudent.mesatarja();

  for (var student in studentet) {
    if (student.mesatarja() > maxMesatarja) {
      maxMesatarja = student.mesatarja();
      topStudent = student;
    }
  }

  // Printimi i rezultatit
  print('Top: ${topStudent.emri} - ${topStudent.mesatarja().toStringAsFixed(2)}');
}
