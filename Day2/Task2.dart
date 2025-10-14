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
  // Krijo një instance të Store
  Store repo = Store();

  // Shto disa produkte
  repo.addProduct(Product(1, "Bukë", 5.0));
  repo.addProduct(Product(2, "Qumësht", 12.5));
  repo.addProduct(Product(3, "Djathë", 20.0));
  repo.addProduct(Product(4, "Vaj", 30.0));

  // Fshi produktin me id = 2
  bool fshire = repo.removeById(2);
  print(fshire ? "Produkti u fshi me sukses!" : "Produkti nuk u gjet!");

  // Merr produktet në intervalin 10.0 – 25.0
  List<Product> rezultat = repo.inPriceRange(10.0, 25.0);

  print("\nProduktet në intervalin 10.0–25.0:");
  for (var p in rezultat) {
    print("#${p.id} ${p.name} - ${p.price.toStringAsFixed(2)}");
  }
}
