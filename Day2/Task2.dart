
class Product {
  int id;
  String name;
  double price;

  Product(this.id, this.name, this.price);
}

class Store {
  List<Product> store = [];

  // Shto produkt
  void addProduct(Product p) {
    store.add(p);
  }

  // Fshi produkt sipas id
  bool removeById(int id) {
    for (var p in store) {
      if (p.id == id) {
        store.remove(p);
        return true;
      }
    }
    return false;
  }

  // Merr produktet në një interval çmimesh
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
  Store myStore = Store();

  // Shto disa produkte
  myStore.addProduct(Product(1, "Notebook", 15.5));
  myStore.addProduct(Product(2, "Pen", 5.0));
  myStore.addProduct(Product(3, "Mouse", 20.0));
  myStore.addProduct(Product(4, "Keyboard", 25.0));

  // Fshi produktin me id=2
  bool fshi = myStore.removeById(2);
  print("Fshi produktin me id=2: $fshi");

  // Merr produktet me çmim 10.0 - 25.0
  List<Product> inRange = myStore.inPriceRange(10.0, 25.0);
  print("Produkte në çmim 10.0–25.0:");
  for (var p in inRange) {
    print("#${p.id} ${p.name} - ${p.price.toStringAsFixed(2)}");
  }
}
