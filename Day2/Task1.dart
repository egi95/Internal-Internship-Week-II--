class Student {
  String emri;
  List<double> nota;
  
  Student(this.emri, this.nota);
  
  double mesatarja() {
    if (nota.isEmpty) return 0.0;
    
    double shuma = 0.0;
    for (double n in nota) {
      shuma += n;
    }
    
    return shuma / nota.length;
  }
}

void main() {
  // Krijimi i studentëve
  List<Student> studentet = [
    Student("Ana", [8, 9, 10]),
    Student("Ardit", [6, 7, 8]),
    Student("Blerina", [9.5, 8.5, 10, 9]),
    Student("Dior", []), // Test me listë bosh
    Student("Era", [7, 8, 6.5, 9]),
  ];
  
  // Gjetja e studentit me mesataren më të lartë
  Student topStudent = studentet[0];
  for (Student student in studentet) {
    if (student.mesatarja() > topStudent.mesatarja()) {
      topStudent = student;
    }
  }
  
  // Printimi i rezultatit
  print("Lista e studentëve:");
  for (Student student in studentet) {
    print("${student.emri}: ${student.nota} -> Mesatarja: ${student.mesatarja().toStringAsFixed(2)}");
  }
  
  print("\nTop: ${topStudent.emri} - ${topStudent.mesatarja().toStringAsFixed(2)}");
  
  // Test shtesë me student që ka listë bosh
  print("\n--- Test shtesë ---");
  Student studentBosh = Student("Test", []);
  print("${studentBosh.emri} me nota të zbrazëta: ${studentBosh.mesatarja().toStringAsFixed(2)}");
}
