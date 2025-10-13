void main() {
  
  List<double> nota = [3, 3, 4, 4, 4, 5];
  
  double mesatarja = (nota[0] + nota[1] + nota[2] + nota[3] + nota[4] + nota[5]) / nota.length;
  
  String mesatarja_decimal = mesatarja.toStringAsFixed(2);
  
  if (nota.length < 1){
    print(0.0);
  }
  else {
    print(mesatarja_decimal);
  }
  
}
