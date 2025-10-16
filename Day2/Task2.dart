class Product {
  int id;
  String name;
  double price;
  
  Product(this.id, this.name, this.price);
  
  @override
  String toString() {
    return "#$id $name - ${price.toStringAsFixed(2)}";
  }
}

class Store {
  List<Product> store = [];
  
  void addProduct(Product p) {
    store.add(p);
    print("U shtua: $p");
  }
  
  bool removeById(int id) {
    for (int i = 0; i < store.length; i++) {
      if (store[i].id == id) {
        Product removed = store.removeAt(i);
        print("U fshi: $removed");
        return true;
      }
    }
    print("Nuk u gjet produkt me id=$id");
    return false;
  }
  
  List<Product> inPriceRange(double min, double max) {
    List<Product> result = [];
    for (Product p in store) {
      if (p.price >= min && p.price <= max) {
        result.add(p);
      }
    }
    return result;
  }
  
  void printAllProducts() {
    if (store.isEmpty) {
      print("Nuk ka produkte në dyqan.");
      return;
    }
    
    print("\nTë gjitha produktet në dyqan:");
    for (Product p in store) {
      print(p);
    }
  }
}

void main() {
  Store store = Store();
  
  print("=== SHTIMI I PRODUKTEVE ===");
  // Shtimi i 4 produkteve
  store.addProduct(Product(1, "Laptop", 599.99));
  store.addProduct(Product(2, "Mouse", 15.50));
  store.addProduct(Product(3, "Keyboard", 25.75));
  store.addProduct(Product(4, "Headphones", 12.99));
  
  store.printAllProducts();
  
  print("\n=== FSHIRJA E PRODUKTIT ID=2 ===");
  bool removed = store.removeById(2);
  print("Fshirja u krye: $removed");
  
  store.printAllProducts();
  
  print("\n=== PRODUKTET NË ÇMIMET 10.0 - 25.0 ===");
  List<Product> inRange = store.inPriceRange(10.0, 25.0);
  
  if (inRange.isEmpty) {
    print("Nuk ka produkte në këtë interval çmimesh.");
  } else {
    print("Produktet me çmim 10.0 - 25.0:");
    for (Product p in inRange) {
      print(p);
    }
  }
  
  // Test shtesë: Fshij produkt që nuk ekziston
  print("\n=== TEST FSHIRJE PRODUKTI JOEKZISTUES ===");
  bool removedNonExistent = store.removeById(10);
  print("Fshirja u krye: $removedNonExistent");
  
  // Test shtesë: Interval pa produkte
  print("\n=== PRODUKTET NË ÇMIMET 100.0 - 200.0 ===");
  List<Product> emptyRange = store.inPriceRange(100.0, 200.0);
  if (emptyRange.isEmpty) {
    print("Nuk ka produkte në intervalin 100.0 - 200.0");
  }
}
