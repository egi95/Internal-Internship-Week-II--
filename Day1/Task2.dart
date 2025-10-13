void main() {
  
  List<int> numra = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
  
  Map<String, String> ndaj = {
    'cift': '2, 4, 6, 8, 10, 12',
    'tek': '1, 3, 5, 7, 9, 11'
  };
  
  for (var number in numra){
    if (number % 2 == 0){
      print("$number eshte cift");
    }
    else{
      print("$number eshte tek");
    }
      
  }
  
  
}
