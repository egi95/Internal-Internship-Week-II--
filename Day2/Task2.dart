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

  myStore.addProduct(Product(1, 'Notebook', 15.5));
  myStore.addProduct(Product(2, 'Pen', 5.0));
  myStore.addProduct(Product(3, 'Backpack', 25.0));
  myStore.addProduct(Product(4, 'Calculator', 20.0));

  bool fshi = myStore.removeById(2);
  print('Produkt fshirë: $fshi');

  List<Product> inRange = myStore.inPriceRange(10.0, 25.0);

  for (var p in inRange) {
    print('#${p.id} ${p.name} - ${p.price.toStringAsFixed(2)}');
  }
}
