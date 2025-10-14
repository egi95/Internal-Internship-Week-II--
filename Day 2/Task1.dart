class Student {
  
  String emri = "Noar";
  var nota = [4, 4, 4, 3, 5];
  
  Student(String emri, var nota){
    this.emri = emri;
    this.nota = nota;
    
    
  }
 
  double Mesatarja() {
    
    var sum_nota = 0;
 
    
    for (int i = 0; i <= nota.length; i++){
      sum_nota += nota[i];
    }
    return sum_nota / nota.length;
    
  }
  
  void display() {
    print(Mesatarja());
  }
 }
  

    



void main() {
  
  Student student1 = Student("Noar", [4, 4, 4, 3, 5]);
   
  print("Name: ${student1.emri}");
  print("Nota: ${student1.nota}");
  student1.display();
  
  Student student2 = Student("Ledion", [3, 2, 4, 5, 5]);
  
  print("Name: ${student2.emri}");
  print("Nota: ${student2.nota}");
  student2.display();
  
  Student student3 = Student("Jon", [4, 4, 4, 5, 5]);
  
  print("Name: ${student3.emri}");
  print("Nota: ${student3.nota}");
  student3.display();
    
}
