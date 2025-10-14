// Krijojmë klasën Student
class Student {
  String emri;
  List<double> nota;

  // Konstruktor me inicializim të variablave
  Student(this.emri, this.nota);

  // Metoda për llogaritjen e mesatares
  double mesatarja() {
    if (nota.isEmpty) {
      return 0.0; // nëse lista është bosh
    }
    double shuma = nota.reduce((a, b) => a + b);
    return shuma / nota.length;
  }
}

void main() {
  // Krijojmë disa studentë
  var s1 = Student("Ana", [8, 9, 10]);
  var s2 = Student("Ardit", [6, 7, 8]);
  var s3 = Student("Elira", []); // lista bosh

  // Vendosim studentët në listë
  List<Student> studentet = [s1, s2, s3];

  // Gjejmë studentin me mesataren më të lartë
  Student top = studentet[0];

  for (var s in studentet) {
    if (s.mesatarja() > top.mesatarja()) {
      top = s;
    }
  }

  // Printimi i rezultatit
  print("Top: ${top.emri} - ${top.mesatarja().toStringAsFixed(2)}");
}
