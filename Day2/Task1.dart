// Task 1 – Klasa Student dhe mesatarja

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
  // Krijimi i disa studentëve për testim
  List<Student> studentet = [
    Student('Ana', [8, 9, 10]),
    Student('Ardit', [6, 7, 8]),
    Student('Besa', []), // lista bosh
  ];

  // Gjetja e studentit me mesataren më të lartë
  Student topStudent = studentet[0];
  for (var s in studentet) {
    if (s.mesatarja() > topStudent.mesatarja()) {
      topStudent = s;
    }
  }

  // Printimi i rezultatit
  print('Top: ${topStudent.emri} - ${topStudent.mesatarja().toStringAsFixed(2)}');
}
