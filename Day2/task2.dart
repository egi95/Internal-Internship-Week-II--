class Product {
  int id;
  String name;
  double price;

  Product(this.id, this.name, this.price);
}

class Store {
  List<Product> products = [];

  void addProduct(Product p) {
    products.add(p);
  }

  bool removeById(int id) {
    int before = products.length;
    products.removeWhere((p) => p.id == id);
    return products.length < before;
  }

  List<Product> inPriceRange(double min, double max) {
    return products.where((p) => p.price >= min && p.price <= max).toList();
  }
}

void main() {
  Store store = Store();

  store.addProduct(Product(1, "Soap", 12.5));
  store.addProduct(Product(2, "Shampoo", 20.0));
  store.addProduct(Product(3, "Toothpaste", 8.0));
  store.addProduct(Product(4, "Cream", 25.0));

  bool removed = store.removeById(2);
  print("Removed id=2: $removed");

  List<Product> filtered = store.inPriceRange(10.0, 25.0);

  print("\nProducts in range 10.0 - 25.0:");
  for (var p in filtered) {
    print("#${p.id} ${p.name} - ${p.price.toStringAsFixed(2)}");
  }
}
