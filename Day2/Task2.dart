class Product {
  int id;
  String name;
  double price;

  Product(this.id, this.name, this.price);
}

class Store {
  List<Product> store = [];

  // Shton një produkt në listë
  void addProduct(Product p) {
    store.add(p);
  }

  // Fshin produkt sipas ID
  bool removeById(int id) {
    return store.removeWhere((p) => p.id == id) > 0;
  }

  // Kthen produktet në intervalin e çmimit
  List<Product> inPriceRange(double min, double max) {
    return store.where((p) => p.price >= min && p.price <= max).toList();
  }

  // Printon të gjitha produktet
  void printAll() {
    for (var p in store) {
      print("#${p.id} ${p.name} - ${p.price.toStringAsFixed(2)}");
    }
  }
}

void main() {
  var s = Store();

  // Shtojmë disa produkte
  s.addProduct(Product(1, "Laps", 5.5));
  s.addProduct(Product(2, "Libër", 12.0));
  s.addProduct(Product(3, "Çantë", 25.0));
  s.addProduct(Product(4, "Shishe uji", 15.75));

  print("=== Lista fillestare ===");
  s.printAll();

  // Fshijmë produktin me id = 2
  s.removeById(2);

  print("\n=== Pas fshirjes së produkti
