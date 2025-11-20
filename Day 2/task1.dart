class Student {
  String emri;
  List<double> nota;

  Student(this.emri, this.nota);

  double mesatarja() {
    if (nota.isEmpty) return 0.0;
    double total = nota.reduce((a, b) => a + b);
    return total / nota.length;
  }
}

void main() {
  List<Student> studentet = [
    Student("Ana", [8, 9, 10]),
    Student("Ardit", [6, 7, 8]),
    Student("Beni", []),         // lista bosh
  ];

  Student top = studentet.reduce((a, b) =>
      a.mesatarja() > b.mesatarja() ? a : b);

  print("Top: ${top.emri} - ${top.mesatarja().toStringAsFixed(2)}");
}
