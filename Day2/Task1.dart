class Student {
  String emri;
  List<double> nota;

  Student(this.emri, this.nota);

  double mesatarja() {
    if (nota.isEmpty) {
      return 0.0;
    } else {
      double shuma = 0;
      for (double n in nota) {
        shuma += n;
      }
      return shuma / nota.length;
    }
  }
}

void main() {
  List<Student> studentet = [
    Student("Shqiponja", [5, 5, 4, 5]),
    Student("Olti", [5, 4, 5, 3]),
    Student("Dreni", []),
  ];

  Student? topStudent;
  double maxMesatare = 0.0;

  for (Student s in studentet) {
    double mes = s.mesatarja();
    if (mes > maxMesatare) {
      maxMesatare = mes;
      topStudent = s;
    }
  }

  if (topStudent != null) {
    print("Top: ${topStudent!.emri} - ${maxMesatare.toStringAsFixed(2)}");
  } else {
    print("Nuk ka studentë në listë.");
  }
}
