class Product {
  int id;
  String name;
  double price;

  Product(this.id, this.name, this.price);
}

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
  List<Product> results = [];
  for (var p in store) {
    if (p.price >= min && p.price <= max) {
      results.add(p);
    }
  }
  return results;
}

void main() {
  addProduct(Product(1, 'Laptop', 1000.0));
  addProduct(Product(2, 'Mouse', 15.5));
  addProduct(Product(3, 'Keyboard', 20.0));
  addProduct(Product(4, 'USB Cable', 5.0));

  bool removed = removeById(2);
  print('Product with ID 2 removed? $removed\n');

  List<Product> filtered = inPriceRange(10.0, 25.0);

  for (var p in filtered) {
    print('#${p.id} ${p.name} - ${p.price.toStringAsFixed(2)}');
  }
}
