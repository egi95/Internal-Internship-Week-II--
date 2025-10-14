// Task 2 – Inventar i thjeshtë produktesh
// Autor: [Vendos emrin tënd]
// Data: [Vendos datën]
// Përshkrimi: Program që menaxhon një listë produktesh në memorie

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

  // Kthe produktet në një interval çmimi
  List<Product> inPriceRange(double min, double max) {
    List<Product> results = [];
    for (var p in store) {
      if (p.price >= min && p.price <= max) {
        results.add(p);
      }
    }
    return results;
  }
}

void main() {
  Store myStore = Store();

  // Shto disa produkte
  myStore.addProduct(Product(1, "Notebook", 12.5));
  myStore.addProduct(Product(2, "Pen", 5.0));
  myStore.addProduct(Product(3, "Calculator", 20.0));
  myStore.addProduct(Product(4, "Bag", 25.0));

  // Fshi produktin me id=2
  bool removed = myStore.removeById(2);
  print("Removed id=2: $removed\n");

  // Merr produktet në interval 10.0–25.0
  List<Product> filtered = myStore.inPriceRange(10.0, 25.0);

  // Printo produktet
  for (var p in filtered) {
    print("#${p.id} ${p.name} - ${p.price.toStringAsFixed(2)}");
  }
}
