class Product {
  int id;
  String name;
  double price;

  Product(this.id, this.name, this.price);
}

class Store {
  List<Product> store = [];

  // Shton produkt në listë
  void addProduct(Product p) {
    store.add(p);
  }

  // Fshin produkt sipas ID-së
  bool removeById(int id) {
    return store.removeWhere((p) => p.id == id) > 0;
  }

  // Kthen listën e produkteve brenda një intervali çmimesh
  List<Product> inPriceRange(double min, double max) {
    return store.where((p) => p.price >= min && p.price <= max).toList();
  }

  // Printon të gjitha produktet në listë
  void printAll() {
    for (var p in store) {
      print("#${p.id} ${p.name} - ${p.price.toStringAsFixed(2)}");
    }
  }
}

void main() {
  Store myStore = Store();

  // Shtojmë disa produkte
  myStore.addProduct(Product(1, "Laps", 5.0));
  myStore.addProduct(Product(2, "Fletore", 12.5));
  myStore.addProduct(Product(3, "Libër", 22.0));
  myStore.addProduct(Product(4, "Çantë", 35.0));

  print(" Lista fillestare e produkteve:");
  myStore.printAll();

  // Fshijmë produktin me id = 2
  bool deleted = myStore.removeById(2);
  print("\n Produkti me ID 2 u fshi: $deleted");

  print("\n Lista pas fshirjes:");
  myStore.printAll();

  // Gjejmë produktet me çmim 10.0–25.0
  print("\n Produkte në intervalin 10.0 – 25.0:");
  List<Product> range = myStore.inPriceRange(10.0, 25.0);
  for (var p in range) {
    print("#${p.id} ${p.name} - ${p.price.toStringAsFixed(2)}");
  }
}
