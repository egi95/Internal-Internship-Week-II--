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
    int initialLength = store.length;
    store.removeWhere((p) => p.id == id);
    return store.length < initialLength;
  }

  List<Product> inPriceRange(double min, double max) {
    return store.where((p) => p.price >= min && p.price <= max).toList();
  }
}

void main() {
  Store myStore = Store();

  myStore.addProduct(Product(1, 'Apple', 5.5));
  myStore.addProduct(Product(2, 'Milk', 12.0));
  myStore.addProduct(Product(3, 'Bread', 20.0));
  myStore.addProduct(Product(4, 'Cheese', 30.0));

  bool removed = myStore.removeById(2);
  print('U fshi produkti me id 2? $removed');


  List<Product> filtered = myStore.inPriceRange(10.0, 25.0);

  for (var p in filtered) {
    print('#${p.id} ${p.name} - ${p.price.toStringAsFixed(2)}');
  }
}
