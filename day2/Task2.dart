class Product {
  int id;
  String name;
  double price;

  // Konstruktor
  Product(this.id, this.name, this.price);
}

// Repo në memorie
List<Product> store = [];

// Shton produkt në listë
void addProduct(Product p) {
  store.add(p);
}

// Fshin produkt sipas ID-së, kthen true nëse fshihet
bool removeById(int id) {
  return store.removeWhere((p) => p.id == id) > 0;
}

// Kthen listën e produkteve në interval çmimesh
List<Product> inPriceRange(double min, double max) {
  return store.where((p) => p.price >= min && p.price <= max).toList();
}

void main() {
  // Shtojmë disa produkte
  addProduct(Product(1, "Soap", 5.5));
  addProduct(Product(2, "Shampoo", 12.0));
  addProduct(Product(3, "Toothpaste", 18.5));
  addProduct(Product(4, "Perfume", 35.0));

  // Fshijmë produktin me id=2
  bool removed = removeById(2);
  print(removed ? "Product with id=2 removed." : "Product not found.");

  // Marrim produktet në intervalin e çmimeve 10.0–25.0
  List<Product> filtered = inPriceRange(10.0, 25.0);

  // Printojmë produktet e gjetura
  print("\nProducts in range 10.0–25.0:");
  for (var p in filtered) {
    print("#${p.id} ${p.name} - ${p.price.toStringAsFixed(2)}");
  }
}
