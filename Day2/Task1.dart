class Student {
  String emri;
  List<double> nota;

  Student(this.emri, this.nota);

  double mesatarja() {
    if (nota.isEmpty) {
      return 0.0;
    }
    double total = 0;
    for (double n in nota) {
      total += n;
    }
    return total / nota.length;
  }
}

void main() {
  List<Student> studentet = [
    Student("Mikeli", [8, 9, 10]),
    Student("Ylli", [6, 7, 8]),
    Student("Aroni", []),
  ];

  Student topStudent = studentet[0];
  for (Student s in studentet) {
    if (s.mesatarja() > topStudent.mesatarja()) {
      topStudent = s;
    }
  }

  print("Top: ${topStudent.emri} - ${topStudent.mesatarja().toStringAsFixed(2)}");
}
