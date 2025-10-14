class Student {
  String emri;
  List<double> nota;

  // Konstruktor
  Student(this.emri, this.nota);

  // Metodë për të llogaritur mesataren
  double mesatarja() {
    if (nota.isEmpty) return 0.0;
    double total = 0.0;
    for (double n in nota) {
      total += n;
    }
    return total / nota.length;
  }
}

void main() {
  // Krijojmë listën e studentëve
  List<Student> studentet = [
    Student("Ana", [8, 9, 10]),
    Student("Ardit", [6, 7, 8]),
    Student("Blerina", [10, 9, 10]),
    Student("Elira", []) // lista bosh
  ];

  // Gjejmë studentin me mesataren më të lartë
  Student topStudent = studentet[0];
  for (Student s in studentet) {
    if (s.mesatarja() > topStudent.mesatarja()) {
      topStudent = s;
    }
  }

  // Printojmë rezultatet me 2 shifra pas presjes
  print("Top: ${topStudent.emri} - ${topStudent.mesatarja().toStringAsFixed(2)}");
}
