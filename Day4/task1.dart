void main() {
  // Krijimi i studentëve
  List<Student> studentet = [
    Student('Ana', [8, 9, 10]),
    Student('Ardit', [6, 7, 8]),
    Student('Blerina', []), // lista bosh
  ];

  // Gjej studentin me mesataren më të lartë
  Student? topStudent;
  double maxMesatarja = 0.0;

  for (Student s in studentet) {
    double m = s.mesatarja();
    if (m > maxMesatarja) {
      maxMesatarja = m;
      topStudent = s;
    }
  }

  if (topStudent != null) {
    print('Top: ${topStudent.emri} - ${topStudent.mesatarja().toStringAsFixed(2)}');
  } else {
    print('Nuk ka studentë.');
  }
}

// Klasa Student
class Student {
  String emri;
  List<double> nota;

  // Konstruktor
  Student(this.emri, this.nota);

  // Metoda për mesataren
  double mesatarja() {
    if (nota.isEmpty) return 0.0;

    double shuma = 0.0;
    for (double n in nota) {
      shuma += n;
    }

    return shuma / nota.length;
  }
}
