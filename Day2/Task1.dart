class Student {
  String emri;
  List<double> nota;

  // Konstruktor
  Student(this.emri, this.nota);

  // Metoda që llogarit mesataren
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
  // Krijojmë disa studentë
  var studenti1 = Student("Ana", [8, 9, 10]);
  var studenti2 = Student("Ardit", [6, 7, 8]);
  var studenti3 = Student("Noela", []); // pa nota

  // Lista e studentëve
  var studentet = [studenti1, studenti2, studenti3];

  // Gjejmë studentin me mesataren më të lartë
  Student topStudent = studentet[0];
  for (var s in studentet) {
    if (s.mesatarja() > topStudent.mesatarja()) {
      topStudent = s;
    }
  }

  // Printimi i rezultatit
  print("Top: ${topStudent.emri} - ${topStudent.mesatarja().toStringAsFixed(2)}");
}
