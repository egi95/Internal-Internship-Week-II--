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
  var store = Store();

  // Shto 4 produkte
  store.addProduct(Product(1, "Shampoo", 12.50));
  store.addProduct(Product(2, "Soap", 5.99));
  store.addProduct(Product(3, "Toothpaste", 15.00));
  store.addProduct(Product(4, "Cream", 24.90));

  // Fshi produktin me id=2
  bool deleted = store.removeById(2);
  print(deleted ? "Produkti u fshi me sukses.\n" : "Produkti nuk u gjet.\n");

  // Merr produktet në intervalin 10.0–25.0
  print("Produktet me çmim 10.0 - 25.0:");
  var filtered = store.inPriceRange(10.0, 25.0);
  store.printProducts(filtered);
}
