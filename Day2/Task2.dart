class Product {
  int id;
  String name;
  double price;

  Product(this.id, this.name, this.price);
}

class Store {
  List<Product> store = [];

  void addProduct(Product p) {
    store.add(p);
  }

  bool removeById(int id) {
    return store.removeWhere((p) => p.id == id) > 0;
  }

  List<Product> inPriceRange(double min, double max) {
    return store.where((p) => p.price >= min && p.price <= max).toList();
  }

  void printProducts(List<Product> products) {
    for (var p in products) {
      print("#${p.id} ${p.name} - ${p.price.toStringAsFixed(2)}");
    }
  }
}

void main() {
  var s = Store();

  // 🔹 Shtimi i 4 produkteve
  s.addProduct(Product(1, "Laps", 5.0));
  s.addProduct(Product(2, "Libër", 12.5));
  s.addProduct(Product(3, "Çantë", 30.0));
  s.addProduct(Product(4, "Shishe uji", 15.75));

  // 🔹 Fshirja e produktit me id=2
  bool deleted = s.removeById(2);
  print(deleted ? "Produkti me id=2 u fshi." : "Produkti nuk u gjet.");

  // 🔹 Printimi i produkteve në intervalin e çmimit 10.0–25.0
  print("\nProdukte në intervalin 10.0–25.0:");
  s.printProducts(s.inPriceRange(10.0, 25.0));
}
