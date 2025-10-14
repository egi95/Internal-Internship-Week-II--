class Student {
  String emri;
  List<double> nota;
  
  Student(this.emri, this.nota);
  
  double mesatarja() {
    if (nota.isEmpty) {
      return 0.0;
    }
    
    double shuma = 0.0;
    for (double note in nota) {
      shuma += note;
    }
    
    return shuma / nota.length;
  }
  
  @override
  String toString() {
    return '$emri: $nota (Mesatarja: ${mesatarja().toStringAsFixed(2)})';
  }
}

void main() {
  // Krijojmë listën e studentëve
  List<Student> studentet = [
    Student('Ana', [8, 9, 10]),
    Student('Ardit', [6, 7, 8]),
    Student('Blerina', [9.5, 8.5, 10, 9]),
    Student('Dritan', []), // Student me lista bosh
    Student('Era', [7, 8, 6.5, 9]),
  ];
  
  // Printojmë të gjithë studentët
  print('Lista e studentëve:');
  for (Student student in studentet) {
    print(student);
  }
  print('');
  
  // Gjejmë studentin me mesataren më të lartë
  Student? topStudent;
  double maxMesatarja = -1.0;
  
  for (Student student in studentet) {
    double mesatarja = student.mesatarja();
    if (mesatarja > maxMesatarja) {
      maxMesatarja = mesatarja;
      topStudent = student;
    }
  }
  
  // Printojmë rezultatin
  if (topStudent != null) {
    print('Top: ${topStudent.emri} - ${topStudent.mesatarja().toStringAsFixed(2)}');
  } else {
    print('Nuk ka studentë në listë!');
  }
  
  // Test shtesë: Nëse të gjithë studentët kanë lista bosh
  print('\n--- Test me të gjithë studentët me lista bosh ---');
  List<Student> studentetBosh = [
    Student('Fisnik', []),
    Student('Gent', []),
  ];
  
  Student? topStudentBosh;
  double maxMesatarjaBosh = -1.0;
  
  for (Student student in studentetBosh) {
    double mesatarja = student.mesatarja();
    if (mesatarja > maxMesatarjaBosh) {
      maxMesatarjaBosh = mesatarja;
      topStudentBosh = student;
    }
  }
  
  if (topStudentBosh != null) {
    print('Top: ${topStudentBosh.emri} - ${topStudentBosh.mesatarja().toStringAsFixed(2)}');
  }
}
