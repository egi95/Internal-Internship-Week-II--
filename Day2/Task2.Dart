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
    for (var p in store) {
      if (p.id == id) {
        store.remove(p);
        return true;
      }
    }
    return false;
  }

  List<Product> inPriceRange(double min, double max) {
    List<Product> result = [];
    for (var p in store) {
      if (p.price >= min && p.price <= max) {
        result.add(p);
      }
    }
    return result;
  }
}

void main() {
  Store s = Store();
  s.addProduct(Product(1, "Uji", 10.5));
  s.addProduct(Product(2, "Kafe", 8.0));
  s.addProduct(Product(3, "Shampone", 15.75));
  s.addProduct(Product(4, "Sapun", 22.0));

  s.removeById(2);

  List<Product> rezultat = s.inPriceRange(10.0, 25.0);
  for (var p in rezultat) {
    print("#${p.id} ${p.name} - ${p.price.toStringAsFixed(2)}");
  }
}
