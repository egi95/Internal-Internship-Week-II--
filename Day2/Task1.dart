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

  List<Student> students = [
    Student('Ana', [8, 9, 10]),
    Student('Ardit', [6, 7, 8]),
    Student('Elira', []) 
  ];


  Student topStudent = students[0];
  for (var s in students) {
    if (s.mesatarja() > topStudent.mesatarja()) {
      topStudent = s;
    }
  }

 
  print('Top: ${topStudent.emri} - ${topStudent.mesatarja().toStringAsFixed(2)}');
}
