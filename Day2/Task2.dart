class Product {
  int id;
  String name;
  double price;

  // Konstruktor
  Product(this.id, this.name, this.price);
}

// Lista e produkteve (repo në memorie)
List<Product> store = [];

// Shton një produkt në listë
void addProduct(Product p) {
  store.add(p);
}

// Fshin një produkt sipas id-së
bool removeById(int id) {
  return store.removeWhere((p) => p.id == id) > 0;
}

// Kthen listën e produkteve brenda një intervali çmimesh
List<Product> inPriceRange(double min, double max) {
  return store.where((p) => p.price >= min && p.price <= max).toList();
}

void main() {
  // Shtojmë disa produkte
  addProduct(Product(1, "Buke", 10.0));
  addProduct(Product(2, "Qumësht", 8.5));
  addProduct(Product(3, "Vaj", 20.0));
  addProduct(Product(4, "Sheqer", 25.5));

  // Fshijmë produktin me id = 2
  bool deleted = removeById(2);
  print(deleted ? "Produkti me id=2 u fshi." : "Produkti me id=2 nuk u gjet.");

  // Marrim produktet në intervalin e çmimit 10.0 – 25.0
  List<Product> filtered = inPriceRange(10.0, 25.0);

  // Printojmë produktet e filtruar
  print("\nProdukte me çmim midis 10.0 dhe 25.0:");
  for (var p in filtered) {
    print("#${p.id} ${p.name} - ${p.price.toStringAsFixed(2)}");
  }
}

