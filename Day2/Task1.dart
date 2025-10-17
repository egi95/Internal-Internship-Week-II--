class Student {
  String emri;
  List<double> nota;

  Student(this.emri, this.nota);

  double mesatarja() {
    if (nota.isEmpty) return 0.0;
    double sum = 0.0;
    for (double note in nota) {
      sum += note;
    }
    return sum / nota.length;
  }
}

void main() {
  var ana = Student("Ben", [8.0, 9.0, 10.0]);
  var ardit = Student("Arlind", [6.0, 7.0, 8.0]);
  var bledi = Student("Ana", []);  

  List<Student> students = [ana, ardit, bledi];

  Student topStudent = students[0];
  for (var student in students) {
    if (student.mesatarja() > topStudent.mesatarja()) {
      topStudent = student;
    }
  }

  print("Top: ${topStudent.emri} - ${topStudent.mesatarja().toStringAsFixed(2)}");
}
