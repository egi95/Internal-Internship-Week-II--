void main() {
  
  List<double> notat = [7, 8.5, 10, 6];
  
  double rezultati = mesatarja(notat);
  
 
  print(rezultati.toStringAsFixed(2));
}

double mesatarja(List<double> nota) {
  if (nota.isEmpty) {
    return 0.0;
  }
  
  double shuma = 0.0;
  
  for (double n in nota) {
    shuma += n;
  }
  
  return shuma / nota.length;
}
