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
  Store myStore = Store();

  myStore.addProduct(Product(1, "Apple", 12.5));
  myStore.addProduct(Product(2, "Banana", 8.0));
  myStore.addProduct(Product(3, "Orange", 15.75));
  myStore.addProduct(Product(4, "Grapes", 22.0));

  bool removed = myStore.removeById(2);
  print("Produkt i fshirë: $removed\n");

  List<Product> selected = myStore.inPriceRange(10.0, 25.0);

  for (var p in selected) {
    print("#${p.id} ${p.name} - ${p.price.toStringAsFixed(2)}");
  }
}
