// Kjo eshte klasa, gjithmone jashte main()
class Student {
  String emri;
  List<double> nota;

  Student(this.emri, this.nota);

  double mesatarja() {
    if (nota.isEmpty) return 0.0;
    double shuma = nota.reduce((a, b) => a + b);
    return shuma / nota.length;
  }
}

void main() {
  List<Student> studentet = [
    Student('Ana', [8, 9, 10]),
    Student('Ardit', [6, 7, 8]),
    Student('Blerina', []),
    Student('Elira', [9, 10, 10])
  ];

  Student topStudent = studentet[0];
  for (var s in studentet) {
    if (s.mesatarja() > topStudent.mesatarja()) {
      topStudent = s;
    }
  }

  print('Top: ${topStudent.emri} - ${topStudent.mesatarja().toStringAsFixed(2)}');
}

