class Student {
  String emri;
  List<double> nota;

  Student(this.emri, this.nota);

  double mesatarja() {
    if (nota.isEmpty) {
      return 0.0; // nese s'ka nota
    }

    double shuma = 0;
    for (double n in nota) {
      shuma += n; // po mbledh notat
    }

    return shuma / nota.length; // pjesetoj shumen me numrin e notave
  }
}

void main() {
  // po krijoj disa studente
  List<Student> studentet = [
    Student("Ana", [8, 9, 10]),
    Student("Ardit", [6, 7, 8]),
    Student("Bledi", []), // lista bosh
  ];

  Student top = studentet[0]; // filloj me te parin
  for (Student s in studentet) {
    if (s.mesatarja() > top.mesatarja()) {
      top = s; // ruaj studentin me mesataren me te madhe
    }
  }

  print("Top: ${top.emri} - ${top.mesatarja().toStringAsFixed(2)}");
}
