// Task 1 – Klasa Student dhe mesatarja
// Autor: [Vendos emrin tënd]
// Data: [Vendos datën]
// Përshkrimi: Program që krijon studentë, llogarit mesataren dhe gjen studentin me mesataren më të lartë

class Student {
  String emri;
  List<double> nota;

  // Konstruktor
  Student(this.emri, this.nota);

  // Metodë për llogaritjen e mesatares
  double mesatarja() {
    if (nota.isEmpty) {
      return 0.0;
    }
    double shuma = 0;
    for (var n in nota) {
      shuma += n;
    }
    return shuma / nota.length;
  }
}

void main() {
  // Krijimi i listës së studentëve
  List<Student> studentet = [
    Student("Ana", [8, 9, 10]),
    Student("Ardit", [6, 7, 8]),
    Student("Blerina", []), // lista bosh
  ];

  // Gjej studentin me mesataren më të lartë
  Student topStudent = studentet[0];
  for (var s in studentet) {
    if (s.mesatarja() > topStudent.mesatarja()) {
      topStudent = s;
    }
  }

  print("Top: ${topStudent.emri} - ${topStudent.mesatarja().toStringAsFixed(2)}");
}
