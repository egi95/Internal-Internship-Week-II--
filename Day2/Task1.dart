class Student {
  String emri;
  List<double> nota;

  
  Student(this.emri, this.nota);

  
  double mesatarja() {
    if (nota.isEmpty) {
      return 0.0; 
    }
    double shuma = 0;
    for (var n in nota) {
      shuma += n;
    }
    return shuma / nota.length;
  }
}

void main() {
  
  var studenti1 = Student("Ana", [8, 9, 10]);
  var studenti2 = Student("Ardit", [6, 7, 8]);
  var studenti3 = Student("Bora", []); // ka lista bosh

  
  var studentet = [studenti1, studenti2, studenti3];

  
  Student topStudent = studentet[0];
  for (var s in studentet) {
    if (s.mesatarja() > topStudent.mesatarja()) {
      topStudent = s;
    }
  }

  
  print("Top: ${topStudent.emri} - ${topStudent.mesatarja().toStringAsFixed(2)}");
}

