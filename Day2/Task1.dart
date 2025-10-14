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
  // Krijojmë disa studentë
  List<Student> studentet = [
    Student("Aron", [8, 9, 10]),
    Student("Alk", [6, 7, 8]),
    Student("Gert", []),
  ];

  if (studentet.isEmpty) {
    print("Nuk ka studentë.");
  } else {
    Student top = studentet[0];
    for (Student s in studentet) {
      if (s.mesatarja() > top.mesatarja()) {
        top = s;
      }
    }
    print("Top: ${top.emri} - ${top.mesatarja().toStringAsFixed(2)}");
  }
}

