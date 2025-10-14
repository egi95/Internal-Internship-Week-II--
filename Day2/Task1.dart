class Student {
  String emri;
  List<double> nota;

  Student(this.emri, this.nota);
  double mesatarja() {
    if (nota.isEmpty) return 0.0;
    double total = 0.0;
    for (var n in nota) {
      total += n;
    }
    return total / nota.length;
  }
}

void main() {
  
  List<Student> studenti = [
    Student('Ana', [8, 9, 10]),
    Student('Ardit', [6, 7, 8]),
    Student('Blerina', []), 
  ];

  Student topStudent = studenti[0];
  for (var s in studenti) {
    if (s.mesatarja() > topStudent.mesatarja()) {
      topStudent = s;
    }
  }

  print('Top: ${topStudent.emri} - ${topStudent.mesatarja().toStringAsFixed(2)}');
}
