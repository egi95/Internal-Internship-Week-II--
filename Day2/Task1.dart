class Student {
  String emri;
  List<double> nota;

  // Konstruktor
  Student(this.emri, this.nota);

  // Metoda që llogarit mesataren e notave
  double mesatarja() {
    if (nota.isEmpty) {
      return 0.0; // nëse s’ka nota, kthen 0.0
    }
    double shuma = 0.0;
    for (double n in nota) {
      shuma += n;
    }
    return shuma / nota.length;
  }
}

void main() {
  // Krijojmë disa studentë për testim
  List<Student> studentet = [
    Student("Ana", [8, 9, 10]),
    Student("Ardit", [6, 7, 8]),
    Student("Besa", []), // Lista bosh
    Student("Luan", [9, 9, 9]),
  ];

  // Gjejmë studentin me mesataren më të lartë
  Student? topStudent;
  double maxMesatare = -1.0;

  for (var s in studentet) {
    double mes = s.mesatarja();
    if (mes > maxMesatare) {
      maxMesatare = mes;
      topStudent = s;
    }
  }

  if (topStudent != null) {
    print("Top: ${topStudent.emri} - ${maxMesatare.toStringAsFixed(2)}");
  } else {
    print("Nuk ka studentë për të llogaritur mesataren.");
  }
}
