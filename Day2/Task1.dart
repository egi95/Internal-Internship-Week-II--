class Student {
  String emri;
  List<double> nota;

  // Konstruktor
  Student(this.emri, this.nota);

  // Metoda për të llogaritur mesataren
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
  // Lista e studentëve
  List<Student> studentet = [
    Student("Ana", [8, 9, 10]),
    Student("Ardit", [6, 7, 8]),
    Student("Elira", []),
  ];

  // Gjejmë studentin me mesataren më të lartë
  Student top = studentet[0];
  for (Student s in studentet) {
    if (s.mesatarja() > top.mesatarja()) {
      top = s;
    }
  }

  print("Top: ${top.emri} - ${top.mesatarja().toStringAsFixed(2)}");
}
