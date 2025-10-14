// task2.dart
// Inventar i thjeshtë produktesh

class Product {
  int id;
  String name;
  double price;

  Product(this.id, this.name, this.price);

  @override
  String toString() {
    // Formatimi i çmimit me dy shifra pas presjes
    return "#$id $name - ${price.toStringAsFixed(2)}";
  }
}

class Store {
  List<Product> store = [];

  // Shto një produkt në listë
  void addProduct(Product p) {
    store.add(p);
  }

  // Fshij produkt sipas ID-së, kthen true nëse u fshi diçka
  bool removeById(int id) {
    return store.removeWhere((p) => p.id == id) > 0;
  }

  // Kthe produktet që janë në një interval çmimesh
  List<Product> inPriceRange(double min, double max) {
    return store.where((p) => p.price >= min && p.price <= max).toList();
  }

  // Printo të gjithë produktet
  void printAll() {
    for (var p in store) {
      print(p);
    }
  }
}

void main() {
  // Krijo një objekt të Store
  var myStore = Store();

  // Shto disa produkte
  myStore.addProduct(Product(1, "Shampo", 12.5));
  myStore.addProduct(Product(2, "Sapuni", 5.0));
  myStore.addProduct(Product(3, "Pasta dhëmbësh", 15.0));
  myStore.addProduct(Product(4, "Krem duarsh", 25.0));

  print("📦 Lista fillestare e produkteve:");
  myStore.printAll();

  // Fshij produktin me ID = 2
  bool removed = myStore.removeById(2);
  print("\n🗑️ Produkti me ID 2 u fshi: $removed");

  print("\n📦 Lista pas fshirjes:");
  myStore.printAll();

  // Merr produktet me çmim midis 10.0 dhe 25.0
  print("\n💰 Produktet me çmim midis 10.0 dhe 25.0:");
  var range = myStore.inPriceRange(10.0, 25.0);
  for (var p in range) {
    print(p);
  }
}
