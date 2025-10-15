// Krijojmë klasën Student
class Student {
  String emri;
  List<double> nota;

  // Konstruktor
  Student(this.emri, this.nota);

  // Metodë për të llogaritur mesataren
  double mesatarja() {
    if (nota.isEmpty) {
      return 0.0; // Nëse lista është bosh
    }
    double total = 0;
    for (var n in nota) {
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
    Student("Blerina", []), // Lista bosh
  ];

  // Gjejmë studentin me mesataren më të lartë
  Student topStudent = studentet[0]; // Fillimisht i pari

  for (var s in studentet) {
    if (s.mesatarja() > topStudent.mesatarja()) {
      topStudent = s;
    }
  }

  // Printojmë rezultatin
  print("Top: ${topStudent.emri} - ${topStudent.mesatarja().toStringAsFixed(2)}");
}
