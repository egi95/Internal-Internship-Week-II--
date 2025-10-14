class Product {
  int id;
  String name;
  double price;

  Product(this.id, this.name, this.price);
}

class Store {
  List<Product> store = [];

  // Shton një produkt të ri
  void addProduct(Product p) {
    store.add(p);
  }

  // Fshin produkt sipas id-së
  bool removeById(int id) {
    return store.removeWhere((p) => p.id == id) > 0;
  }

  // Kthen produktet që janë brenda intervalit të dhënë të çmimit
  List<Product> inPriceRange(double min, double max) {
    return store.where((p) => p.price >= min && p.price <= max).toList();
  }

  // Printon të gjitha produktet
  void printProducts(List<Product> products) {
    for (var p in products) {
      print("#${p.id} ${p.name} - ${p.price.toStringAsFixed(2)}");
    }
  }
}

void main() {
  Store s = Store();

  // Shtojmë disa produkte
  s.addProduct(Product(1, "Bukë", 10.0));
  s.addProduct(Product(2, "Qumësht", 12.5));
  s.addProduct(Product(3, "Vaj", 25.0));
  s.addProduct(Product(4, "Sheqer", 8.0));

  // Fshijmë produktin me id=2
  bool uFshi = s.removeById(2);
  print(uFshi ? "Produkti u fshi me sukses!" : "Produkti nuk u gjet!");

  // Produktet në intervalin 10.0 - 25.0
  print("\nProduktet me çmim 10.0–25.0:");
  var rezultat = s.inPriceRange(10.0, 25.0);
  s.printProducts(rezultat);
}
