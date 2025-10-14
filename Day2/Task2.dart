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

  s.addProduct(Product(1, "Qumesht", 12.5));
  s.addProduct(Product(2, "Djath", 8.0));
  s.addProduct(Product(3, "Buk", 20.0));
  s.addProduct(Product(4, "Leng", 25.0));

  s.removeById(2);

  List<Product> results = s.inPriceRange(10.0, 25.0);
  for (var p in results) {
    print("#${p.id} ${p.name} - ${p.price.toStringAsFixed(2)}");
  }
}
