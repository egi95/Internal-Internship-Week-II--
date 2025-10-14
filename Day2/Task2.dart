Task 1
  
class Student {
  String emri;
  List<double> nota;

 
  Student(this.emri, this.nota);

 
  double mesatarja() {
    if (nota.isEmpty) {
      return 0.0;
    }
    double shuma = 0;
    for (var n in nota) {
      shuma += n;
    }
    return shuma / nota.length;
  }
}

void main() {
 
  var studenti1 = Student("Ana", [8, 9, 10]);
  var studenti2 = Student("Ardit", [6, 7, 8]);
  var studenti3 = Student("Bora", []); // ka lista bosh

 
  var studentet = [studenti1, studenti2, studenti3];

 
  Student topStudent = studentet[0];
  for (var s in studentet) {
    if (s.mesatarja() > topStudent.mesatarja()) {
      topStudent = s;
    }
  }

 
  print("Top: ${topStudent.emri} - ${topStudent.mesatarja().toStringAsFixed(2)}");
}


Task 2 
  class Product {
  int id;
  String name;
  double price;

  Product(this.id, this.name, this.price);
}

void main() {
  List<Product> store = [];

  void addProduct(Product p) => store.add(p);

  bool removeById(int id) {
    return store.removeWhere((p) => p.id == id) > 0;
  }

  List<Product> inPriceRange(double min, double max) {
    return store.where((p) => p.price >= min && p.price <= max).toList();
  }

 
  addProduct(Product(1, "Book", 12.5));
  addProduct(Product(2, "Pen", 2.0));
  addProduct(Product(3, "Bag", 22.0));
  addProduct(Product(4, "Lamp", 35.0));

  
  removeById(2);

  var result = inPriceRange(10.0, 25.0);

  
  for (var p in result) {
    print("#${p.id} ${p.name} - ${p.price.toStringAsFixed(2)}");
  }
}
