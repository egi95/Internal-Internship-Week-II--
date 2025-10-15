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
  var shop = Store();
  shop.addProduct(Product(1, 'Shampoo', 12.5));
  shop.addProduct(Product(2, 'Toothpaste', 8.0));
  shop.addProduct(Product(3, 'Soap', 15.0));
  shop.addProduct(Product(4, 'Body Lotion', 25.0));

  bool removed = shop.removeById(2);
  print(removed ? 'Product with id=2 removed.' : 'Product not found.');

  var filtered = shop.inPriceRange(10.0, 25.0);

  for (var p in filtered) {
    print('#${p.id} ${p.name} - ${p.price.toStringAsFixed(2)}');
  }
}
