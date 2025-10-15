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
  var s1 = Student('Melisa', [9, 10, 8]);
  var s2 = Student('Erion', [7, 6, 7]);
  var s3 = Student('Dona', []);
  var s4 = Student('Rinor', [8, 9, 9]);

  var studentet = [s1, s2, s3, s4];
  Student top = studentet[0];
  for (var s in studentet) {
    if (s.mesatarja() > top.mesatarja()) {
      top = s;
    }
  }

  print('Top: ${top.emri} - ${top.mesatarja().toStringAsFixed(2)}');
}
