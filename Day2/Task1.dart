class Student {
  String emri;
  List<double> nota;

  // Konstruktor
  Student(this.emri, this.nota);

  // Metoda që llogarit mesataren
  double mesatarja() {
    if (nota.isEmpty) {
      return 0.0;
    }
    double total = 0;
    for (var n in nota) {
      total += n;
    }
    return total / nota.length;
  }
}

void main() {
  // Krijojmë disa studentë
  var s1 = Student('Ana', [8, 9, 10]);
  var s2 = Student('Ardit', [6, 7, 8]);
  var s3 = Student('Besa', []); // pa nota

  List<Student> studentet = [s1, s2, s3];

  // Gjejmë studentin me mesataren më të lartë
  Student top = studentet[0];
  for (var s in studentet) {
    if (s.mesatarja() > top.mesatarja()) {
      top = s;
    }
  }

  print('Top: ${top.emri} - ${top.mesatarja().toStringAsFixed(2)}');
}

