double mesatarja(List<double> nota) {
  if (nota.isEmpty) return 0.0;
  return nota.reduce((a, b) => a + b) / nota.length;
}

void main() {
  print(mesatarja([7, 8.5, 10, 6]).toStringAsFixed(2)); 
  print(mesatarja([]).toStringAsFixed(2));           
  print(mesatarja([9.5, 8.25, 7.75]).toStringAsFixed(2)); 
}
