class Student {
  String emri;
  List<double> nota;

  // Konstruktor
  Student(this.emri, this.nota);

  // Metodë për të llogaritur mesataren e notave
  double mesatarja() {
    if (nota.isEmpty) return 0.0;
    double shuma = nota.reduce((a, b) => a + b);
    return shuma / nota.length;
  }
}

void main() {
  // Krijojmë disa studentë
  List<Student> studentet = [
    Student("Ana", [8, 9, 10]),
    Student("Ardit", [6, 7, 8]),
    Student("Blerina", []), // lista bosh
    Student("Doni", [9, 9, 9]),
  ];

  // Gjejmë studentin me mesataren më të lartë
  Student? topStudent;
  double maxMesatare = 0.0;

  for (var s in studentet) {
    double m = s.mesatarja();
    if (m > maxMesatare) {
      maxMesatare = m;
      topStudent = s;
    }
  }

  // Printojmë rezultatin
  if (topStudent != null) {
    print("Top: ${topStudent.emri} - ${maxMesatare.toStringAsFixed(2)}");
  } else {
    print("Nuk ka studentë.");
  }
}
