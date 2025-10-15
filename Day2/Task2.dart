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
  return store.removeWhere((p) => p.id == id) > 0;
}

List<Product> inPriceRange(double min, double max) {
  return store.where((p) => p.price >= min && p.price <= max).toList();
}

void main() {
  addProduct(Product(1, 'Laptop', 20.0));
  addProduct(Product(2, 'Mouse', 5.0));
  addProduct(Product(3, 'Monitor', 15.5));
  addProduct(Product(4, 'Keyboard', 25.0));

  bool uFshi = removeById(2);
  print(uFshi ? 'Produkti me ID 2 u fshi.' : 'Produkti me ID 2 nuk u gjet.');

  List<Product> filtered = inPriceRange(10.0, 25.0);

  print('Produkte në intervalin 10.0 - 25.0:');
  for (var p in filtered) {
    print('#${p.id} ${p.name} - ${p.price.toStringAsFixed(2)}');
  }
}

