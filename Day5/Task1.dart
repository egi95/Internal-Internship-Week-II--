void main() {
  runApp(StudentApp());
}

class StudentApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StudentApp',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: HomePage(),
    );
  }
}

FAQJA KRYESORE (Lista e Studentëve)
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> students = [
    {'name': 'Arta', 'grade': 9.5},
    {'name': 'Blerim', 'grade': 8.7},
  ];

  void _addStudent(String name, double grade) {
    setState(() {
      students.add({'name': name, 'grade': grade});
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('U shtua studenti: $name')),
    );
  }

  void _deleteStudent(int index) {
    setState(() {
      students.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Studenti u fshi!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista e Studentëve'),
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => InfoPage()),
              );
            },
          )
        ],
      ),
      body: students.isEmpty
          ? Center(child: Text('Nuk ka studentë. Shto një!'))
          : ListView.builder(
              itemCount: students.length,
              itemBuilder: (_, index) {
                final student = students[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: ListTile(
                    title: Text(student['name']),
                    subtitle: Text('Nota: ${student['grade']}'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _deleteStudent(index),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        child: Icon(Icons.add),
        onPressed: () async {
          final newStudent = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AddStudentPage()),
          );
          if (newStudent != null) {
            _addStudent(newStudent['name'], newStudent['grade']);
          }
        },
      ),
    );
  }
}

 FAQJA E SHTIMIT TË STUDENTIT
class AddStudentPage extends StatefulWidget {
  @override
  _AddStudentPageState createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<AddStudentPage> {
  final nameController = TextEditingController();
  final gradeController = TextEditingController();

  void _saveStudent() {
    final name = nameController.text.trim();
    final gradeText = gradeController.text.trim();

    if (name.isEmpty || gradeText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Plotëso të gjitha fushat!')),
      );
      return;
    }

    final grade = double.tryParse(gradeText);
    if (grade == null || grade < 0 || grade > 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Shkruaj notë të vlefshme (0–10)!')),
      );
      return;
    }

    Navigator.pop(context, {'name': name, 'grade': grade});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shto Student')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Emri i studentit',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: gradeController,
              decoration: InputDecoration(
                labelText: 'Nota (0–10)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _saveStudent,
              icon: Icon(Icons.save),
              label: Text('Ruaj'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

FAQJA “Rreth aplikacionit”
class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rreth aplikacionit')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.school, size: 80, color: Colors.indigo),
              SizedBox(height: 20),
              Text(
                '🎓 StudentApp\n\nKy aplikacion u krijua për Day 5 Mini Project.\n\n'
                'Funksione:\n- Shfaq listën e studentëve\n- Shton studentë të rinj\n- Fshin studentë\n\n'
                'Autori: [Shkruaj emrin tënd]',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
