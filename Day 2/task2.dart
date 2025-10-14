class Product {
  int id;
  String name;
  double price;

  Product(this.id, this.name, this.price);
}

// In-memory store (repository)
List<Product> store = [];

// Add a product to the store
void addProduct(Product p) {
  store.add(p);
}

// Remove product by id (returns true if removed)
bool removeById(int id) {
  for (int i = 0; i < store.length; i++) {
    if (store[i].id == id) {
      store.removeAt(i);
      return true;
    }
  }
  return false;
}

// Get products within price range
List<Product> inPriceRange(double min, double max) {
  List<Product> result = [];
  for (Product p in store) {
    if (p.price >= min && p.price <= max) {
      result.add(p);
    }
  }
  return result;
}

void main() {
  // Adding products
  addProduct(Product(1, "Laptop", 1200.50));
  addProduct(Product(2, "Mouse", 25.99));
  addProduct(Product(3, "Keyboard", 45.00));
  addProduct(Product(4, "Headphones", 75.49));

  // Testing inPriceRange
  print("Products between 30 and 100:");
  for (var p in inPriceRange(30, 100)) {
    print("${p.name} - \$${p.price}");
  }

  // Testing remove
  print("\nRemoving product with id 2: ${removeById(2) ? "Success" : "Not Found"}");

  print("\nRemaining products:");
  for (var p in store) {
    print("${p.name} - \$${p.price}");
  }
}
