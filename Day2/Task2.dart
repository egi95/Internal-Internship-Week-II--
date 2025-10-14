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
  var s = Store();
  s.addProduct(Product(1, 'Laptop', 899.99));
  s.addProduct(Product(2, 'Mouse', 19.99));
  s.addProduct(Product(3, 'Keyboard', 49.99));

  print('Para fshirjes: ${s.store.map((p) => p.name).toList()}');
  s.removeById(2);
  print('Pas fshirjes: ${s.store.map((p) => p.name).toList()}');

  var filtered = s.inPriceRange(30, 900);
  print('Produktet midis 30€ dhe 900€: ${filtered.map((p) => p.name).toList()}');
}
