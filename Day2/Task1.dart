// task1.dart
class Student {
  String emri;
  List<double> nota;

  Student(this.emri, this.nota);

  double mesatarja() {
    if (nota.isEmpty) return 0.0;
    double shuma = 0;
    for (var n in nota) {
      shuma += n;
    }
    return shuma / nota.length;
  }
}

void main() {
  // Lista e studenteve
  List<Student> studentet = [
    Student('Ana', [8, 9, 10]),
    Student('Ardit', [6, 7, 8]),
    Student('Lea', []), // lista bosh për testim
    Student('Noar', [9, 9.5, 8.5]),
  ];

  // Gjetja e studentit me mesataren më të lartë
  Student? topStudent;
  double mesMax = 0.0;

  for (var s in studentet) {
    double mes = s.mesatarja();
    if (mes > mesMax) {
      mesMax = mes;
      topStudent = s;
    }
  }

  if (topStudent != null) {
    print('Top: ${topStudent.emri} - ${mesMax.toStringAsFixed(2)}');
  } else {
    print('Nuk ka studentë.');
  }
}
