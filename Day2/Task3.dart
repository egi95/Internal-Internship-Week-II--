class Product {
  int id;
  String name;
  double price;

  // Konstruktor
  Product(this.id, this.name, this.price);
}

// Repo në memorie
List<Product> store = [];

// Funksion për të shtuar produkt
void addProduct(Product p) {
  store.add(p);
}

// Funksion për të fshirë produkt sipas id
bool removeById(int id) {
  for (var p in store) {
    if (p.id == id) {
      store.remove(p);
      return true; // u fshi
    }
  }
  return false; // nuk u gjet
}

// Funksion për të marrë produktet në interval çmimesh
List<Product> inPriceRange(double min, double max) {
  return store.where((p) => p.price >= min && p.price <= max).toList();
}

void main() {
  // Shtojmë disa produkte
  addProduct(Product(1, "Libër", 12.5));
  addProduct(Product(2, "Bllok shënimesh", 8.0));
  addProduct(Product(3, "Stylo", 15.0));
  addProduct(Product(4, "Fshesë", 20.0));

  // Fshijmë produktin me id=2
  removeById(2);

  // Marrim produktet me çmim 10.0 - 25.0
  List<Product> filtered = inPriceRange(10.0, 25.0);

  // Printojmë rezultatet
  for (var p in filtered) {
    print("#${p.id} ${p.name} - ${p.price.toStringAsFixed(2)}");
  }
}
