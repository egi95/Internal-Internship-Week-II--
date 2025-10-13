double mesatarja(List<double> nota) {
  if (nota.isEmpty) return 0.0;
  
  double shuma = 0;
  for (int i = 0; i < nota.length; i++) {
    shuma += nota[i];
  }
  return shuma / nota.length;
}

void main() {
 
  List<double> nota1 = [7, 8.5, 10, 6];
  List<double> nota2 = [];
  
  print(mesatarja(nota1).toStringAsFixed(2));
  print(mesatarja(nota2).toStringAsFixed(2)); 
}
