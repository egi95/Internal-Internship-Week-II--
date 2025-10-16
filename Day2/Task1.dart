class Student{
  String emri;
  List<double>nota;

  Student(this.emri, this.nota);

  double mesatarja() {
    if (nota.isEmpty) return 0.0;
    double sum = nota.reduce((a, b) => a + b);
    return sum / nota.length;
  }
}

void main() { 
  var students = [
    Student ("Ana", [8,9,10])
    Student ("Ardit", [6,7,8])
    Student ("Besa", [])
  ];

  Student top = students[0];
  for (var s in students) {
    if (s.mesatarja() > top.mesatarja()) { 
      top = s;
    } 
  } 

  print("Top: ${top.emri} -${top.mesatarja().toStringAsFixed(2)}");
}
