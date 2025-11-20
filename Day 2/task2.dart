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
}

void main() {
  Store s = Store();

  // Shtimi i produkteve
  s.addProduct(Product(1, "Book", 12.50));
  s.addProduct(Product(2, "Pen", 2.00));
  s.addProduct(Product(3, "Mouse", 20.00));
  s.addProduct(Product(4, "Headset", 30.00));

  // Fshirja e produktit me id=2
  s.removeById(2);

  // Produktet në intervalin 10.0–25.0
  List<Product> result = s.inPriceRange(10.0, 25.0);

  // Printimi
  for (var p in result) {
    print("#${p.id} ${p.name} - ${p.price.toStringAsFixed(2)}");
  }
}
