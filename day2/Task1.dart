class Student {
  String emri;
  List<double> nota;

  // Konstruktor
  Student(this.emri, this.nota);

  // Metoda që llogarit mesataren e notave
  double mesatarja() {
    if (nota.isEmpty) return 0.0;
    double total = 0;
    for (var n in nota) {
      total += n;
    }
    return total / nota.length;
  }
}

void main() {
  // Krijojmë disa studentë
  List<Student> studentet = [
    Student("Ana", [8, 9, 10]),
    Student("Ardit", [6, 7, 8]),
    Student("Loris", []), // lista bosh për testim
  ];

  // Gjejmë studentin me mesataren më të lartë
  Student top = studentet[0];
  for (var s in studentet) {
    if (s.mesatarja() > top.mesatarja()) {
      top = s;
    }
  }

  // Printojmë rezultatin
  print("Top: ${top.emri} - ${top.mesatarja().toStringAsFixed(2)}");
}
