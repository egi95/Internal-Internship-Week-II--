double mesatarja(List<double> nota) {
 
  if (nota.isEmpty) {
    return 0.0;
  }


  double shuma = 0.0;
  for (var n in nota) {
    shuma += n;
  }

  
  double mes = shuma / nota.length;

  return mes;
}

void main() {
  
  List<double> nota1 = [7, 8.5, 10, 6];
  List<double> nota2 = [];
  List<double> nota3 = [9.2, 8.8, 7.5];


  print("Mesatarja e notave 1: ${mesatarja(nota1).toStringAsFixed(2)}");
  print("Mesatarja e notave 2: ${mesatarja(nota2).toStringAsFixed(2)}"); 
  print("Mesatarja e notave 3: ${mesatarja(nota3).toStringAsFixed(2)}"); 
}
