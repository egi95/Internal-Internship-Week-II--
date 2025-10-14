class Student {
  String emri;
  List<double> nota;

  // Konstruktor
  Student(this.emri, this.nota);

  // Metoda për llogaritjen e mesatares
  double mesatarja() {
    if (nota.isEmpty) return 0.0;
    double total = nota.reduce((a, b) => a + b);
    return total / nota.length;
  }
}

void main() {
  // Lista e studentëve
  List<Student> studentet = [
    Student('Ana', [8, 9, 10]),
    Student('Ardit', [6, 7, 8]),
    Student('Blerina', []), // bosh për testim
  ];

  // Gjejmë studentin me mesataren më të lartë
  Student topStudent = studentet.reduce((a, b) =>
      a.mesatarja() >= b.mesatarja() ? a : b);

  print('Top: ${topStudent.emri} - ${topStudent.mesatarja().toStringAsFixed(2)}');
}

