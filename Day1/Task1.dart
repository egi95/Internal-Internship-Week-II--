void main() {
  List<double> nota = [7, 8.5, 10, 6];

  if (nota.isEmpty) {
    print("0.00");
  } else {
    double shuma = 0;
    for (double n in nota) {
      shuma += n;
    }
    double mes = shuma / nota.length;
    print(mes.toStringAsFixed(2));
  }
}

