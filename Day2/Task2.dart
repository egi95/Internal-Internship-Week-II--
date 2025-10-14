 // File: task2.dart

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
    List<Product> result = [];
    for (Product p in store) {
      if (p.price >= min && p.price <= max) {
        result.add(p);
      }
    }
    return result;
  }

  void printAll() {
    for (Product p in store) {
      print("#${p.id} ${p.name} - ${p.price.toStringAsFixed(2)}");
    }
  }
}

void main() {
  Store s = Store();

  // Shtojmë disa produkte
  s.addProduct(Product(1, "Bukë", 10.0));
  s.addProduct(Product(2, "Qumësht", 12.5));
  s.addProduct(Product(3, "Vaj", 25.0));
  s.addProduct(Product(4, "Sheqer", 8.0));

  print("🛒 Lista fillestare:");
  s.printAll();

  // Fshijmë produktin me id = 2
  bool removed = s.removeById(2);
  print("\nProdukt me ID=2 u fshi: $removed");

  print("\nLista pas fshirjes:");
  s.printAll();

  // Produktet në interval çmimesh 10.0 – 25.0
  print("\n📦 Produkte me çmim 10.0–25.0:");
  List<Product> filtered = s.inPriceRange(10.0, 25.0);
  for (Product p in filtered) {
    print("#${p.id} ${p.name} - ${p.price.toStringAsFixed(2)}");
  }
}
