// File: task1.dart

class Student {
  String emri;
  List<double> nota;

  Student(this.emri, this.nota);

  double mesatarja() {
    if (nota.isEmpty) {
      return 0.0;
    }
    double shuma = 0.0;
    for (double n in nota) {
      shuma += n;
    }
    return shuma / nota.length;
  }
}

void main() {
  // Lista e studentëve
  List<Student> studentet = [
    Student("Ana", [8, 9, 10]),
    Student("Ardit", [6, 7, 8]),
    Student("Besa", []),
  ];

  // Gjejmë studentin me mesataren më të lartë
  Student topStudent = studentet[0];
  for (Student s in studentet) {
    if (s.mesatarja() > topStudent.mesatarja()) {
      topStudent = s;
    }
  }

  print("Top: ${topStudent.emri} - ${topStudent.mesatarja().toStringAsFixed(2)}");

  // Printoni mesataret e të gjithëve (opsionale për testim)
  for (Student s in studentet) {
    print("${s.emri}: ${s.mesatarja().toStringAsFixed(2)}");
  }
}
