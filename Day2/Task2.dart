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
    for (int i = 0; i < store.length; i++) {
      if (store[i].id == id) {
        store.removeAt(i);
        return true;
      }
    }
    return false;
  }

  List<Product> inPriceRange(double min, double max) {
    List<Product> filtered = [];
    for (Product p in store) {
      if (p.price >= min && p.price <= max) {
        filtered.add(p);
      }
    }
    return filtered;
  }

  void printAll() {
    for (Product p in store) {
      print("#${p.id} ${p.name} - ${p.price.toStringAsFixed(2)}€");
    }
  }
}

void main() {
  Store s = Store();

  s.addProduct(Product(1, "Bukë", 12.50));
  s.addProduct(Product(2, "Qumësht", 8.90));
  s.addProduct(Product(3, "Djathë", 22.30));
  s.addProduct(Product(4, "Mish", 30.00));

  print("Produktet fillestare:");
  s.printAll();

  bool deleted = s.removeById(2);
  print("\nFshirë id=2? $deleted");

  print("\nProduktet me çmim midis 10.0 dhe 25.0:");
  List<Product> filtered = s.inPriceRange(10.0, 25.0);

  for (Product p in filtered) {
    print("#${p.id} ${p.name} - ${p.price.toStringAsFixed(2)}€");
  }
}
