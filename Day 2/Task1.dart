class Student {
  String name;
  List<double> grades;

  // Constructor
  Student(this.name, this.grades);

  // Method to calculate average
  double average() {
    if (grades.isEmpty) return 0.0;
    double sum = 0;
    for (double grade in grades) {
      sum += grade;
    }
    return sum / grades.length;
  }
}

void main() {
  // List of students
  List<Student> students = [
    Student('Ben Sopi', [7, 8.5, 10, 6]),
    Student('Alice', [9, 9.5, 8]),
    Student('Charlie', [6, 7, 5.5]),
    Student('Diana', []) // Empty grades
  ];

  // Find student with highest average
  Student topStudent = students[0];
  for (Student student in students) {
    if (student.average() > topStudent.average()) {
      topStudent = student;
    }
  }

  print('Top: ${topStudent.name} - ${topStudent.average().toStringAsFixed(2)}');
}
