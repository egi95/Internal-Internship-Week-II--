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
    if (store.any((p) => p.id == id)) {
      store.removeWhere((p) => p.id == id);
      return true;
    }
    return false;
  }

  List<Product> inPriceRange(double min, double max) {
    return store.where((p) => p.price >= min && p.price <= max).toList();
  }
}

void main() {
  Store s = Store();

  // Shto 4 produkte
  s.addProduct(Product(1, "Milk", 12.5));
  s.addProduct(Product(2, "Bread", 8.0));
  s.addProduct(Product(3, "Cheese", 20.0));
  s.addProduct(Product(4, "Juice", 25.5));

  // Fshi produktin me id = 2
  s.removeById(2);

  // Merr produktet në intervalin 10.0 – 25.0
  List<Product> selected = s.inPriceRange(10.0, 25.0);

  print("Products in range 10.0 - 25.0:");
  for (var p in selected) {
    print("#${p.id} ${p.name} - ${p.price.toStringAsFixed(2)}");
  }
}
