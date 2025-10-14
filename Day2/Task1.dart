// task1.dart

class Student {
  String emri;
  List<double> nota;

  // Konstruktor
  Student(this.emri, this.nota);

  // Metodë që llogarit mesataren
  double mesatarja() {
    if (nota.isEmpty) {
      return 0.0; // nëse lista është bosh
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
  var studentet = [
    Student('Ana', [8, 9, 10]),
    Student('Ardit', [6, 7, 8]),
    Student('Besa', []), // lista bosh
  ];

  // Gjejmë studentin me mesataren më të lartë
  Student top = studentet[0];

  for (var s in studentet) {
    if (s.mesatarja() > top.mesatarja()) {
      top = s;
    }
  }

  // Printojmë rezultatin
  print('Top: ${top.emri} - ${top.mesatarja().toStringAsFixed(2)}');
}
