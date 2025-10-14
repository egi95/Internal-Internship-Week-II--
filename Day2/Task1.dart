import 'package:flutter/material.dart';

class Student {
  String emri;
  List<double> nota;

  Student(this.emri, this.nota);

  double mesatarja() {
    if (nota.isEmpty) {
      return 0.0;
    }
    double shuma = nota.reduce((a, b) => a + b);
    return shuma / nota.length;
  }
}

void main() {
  List<Student> studentet = [
    Student("Ana", [8, 9, 10]),
    Student("Ardit", [6, 7, 8]),
    Student("Blerina", []), // Student me lista bosh
  ];

  Student topStudent = studentet[0];

  for (var student in studentet) {
    if (student.mesatarja() > topStudent.mesatarja()) {
      topStudent = student;
    }
  }

  print("Top: ${topStudent.emri} - ${topStudent.mesatarja().toStringAsFixed(2)}");
}
