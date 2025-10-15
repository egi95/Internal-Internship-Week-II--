// Krijojmë klasën Product
class Product {
  int id;
  String name;
  double price;

  Product(this.id, this.name, this.price);
}

// Lista që ruan produktet
List<Product> store = [];

// Funksioni për të shtuar produkt
void addProduct(Product p) {
  store.add(p);
}

// Funksioni për të fshirë produkt nga id
bool removeById(int id) {
  // Gjej produktin me këtë id
  Product? productToRemove = store.firstWhere(
    (p) => p.id == id,
    orElse: () => null,
  );

  if (productToRemove != null) {
    store.remove(productToRemove);
    return true;
  } else {
    return false;
  }
}

// Funksioni për të marrë produktet brenda një intervali çmimi
List<Product> inPriceRange(double min, double max) {
  return store.where((p) => p.price >= min && p.price <= max).toList();
}

// Funksioni për të printuar produktet në formatin e kërkuar
void printProducts(List<Product> products) {
  for (var p in products) {
    print("#${p.id} ${p.name} - ${p.price.toStringAsFixed(2)}");
  }
}

// Demo
void main() {
  // Shtojmë 4 produkte
  addProduct(Product(1, "Apple", 12.5));
  addProduct(Product(2, "Banana", 8.0));
  addProduct(Product(3, "Milk", 20.0));
  addProduct(Product(4, "Bread", 15.75));

  // Fshijmë produktin me id=2
  bool removed = removeById(2);
  print("Product with id=2 removed: $removed");

  // Merrim produktet me çmim 10.0–25.0
  List<Product> filtered = inPriceRange(10.0, 25.0);

  // Printojmë produktet
  print("\nProducts in price range 10.0–25.0:");
  printProducts(filtered);
}
