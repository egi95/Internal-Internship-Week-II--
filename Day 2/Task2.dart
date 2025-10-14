class Product {
  int id;
  String name;
  double price;
  
  Product(this.id, this.name, this.price);
  
  @override
  String toString() {
    return '#$id $name - ${price.toStringAsFixed(2)}';
  }
}

class Store {
  List<Product> store = [];
  
  void addProduct(Product p) {
    store.add(p);
    print('U shtua produkti: $p');
  }
  
  bool removeById(int id) {
    for (int i = 0; i < store.length; i++) {
      if (store[i].id == id) {
        Product removedProduct = store.removeAt(i);
        print('U fshi produkti: $removedProduct');
        return true;
      }
    }
    print('Produkti me id=$id nuk u gjet!');
    return false;
  }
  
  List<Product> inPriceRange(double min, double max) {
    List<Product> result = [];
    for (Product product in store) {
      if (product.price >= min && product.price <= max) {
        result.add(product);
      }
    }
    return result;
  }
  
  void printAllProducts() {
    if (store.isEmpty) {
      print('Nuk ka produkte në dyqan!');
      return;
    }
    
    print('\nTë gjitha produktet në dyqan:');
    for (Product product in store) {
      print(product);
    }
  }
}

void main() {
  // Krijojmë dyqanin
  Store dyqani = Store();
  
  // Shtojmë 4 produkte
  print('=== SHTIMI I PRODUKTEVE ===');
  dyqani.addProduct(Product(1, 'Laptop', 599.99));
  dyqani.addProduct(Product(2, 'Mouse', 15.50));
  dyqani.addProduct(Product(3, 'Tastierë', 45.75));
  dyqani.addProduct(Product(4, 'Monitor', 199.99));
  
  // Printojmë të gjitha produktet
  dyqani.printAllProducts();
  
  // Fshijmë produktin me id=2
  print('\n=== FSHIRJA E PRODUKTIT ===');
  bool uFshi = dyqani.removeById(2);
  print('Fshirja u krye: $uFshi');
  
  // Printojmë të gjitha produktet pas fshirjes
  dyqani.printAllProducts();
  
  // Kërkojmë produktet në rangun e çmimeve 10.0 - 25.0
  print('\n=== KËRKIMI NË RANGUN 10.0 - 25.0 ===');
  List<Product> produkteNeRange = dyqani.inPriceRange(10.0, 25.0);
  
  if (produkteNeRange.isEmpty) {
    print('Nuk u gjet asnjë produkt në rangun 10.0 - 25.0');
  } else {
    print('Produktet në rangun 10.0 - 25.0:');
    for (Product product in produkteNeRange) {
      print(product);
    }
  }
  
  // Test shtesë: Kërkojmë në një rang tjetër
  print('\n=== KËRKIMI NË RANGUN 40.0 - 200.0 ===');
  List<Product> produkteNeRange2 = dyqani.inPriceRange(40.0, 200.0);
  
  if (produkteNeRange2.isEmpty) {
    print('Nuk u gjet asnjë produkt në rangun 40.0 - 200.0');
  } else {
    print('Produktet në rangun 40.0 - 200.0:');
    for (Product product in produkteNeRange2) {
      print(product);
    }
  }
  
  // Test shtesë: Fshijmë një produkt që nuk ekziston
  print('\n=== FSHIRJA E PRODUKTIT QË NUK EKZISTON ===');
  bool uFshi2 = dyqani.removeById(10);
  print('Fshirja u krye: $uFshi2');
  
  // Test shtesë: Shtojmë një produkt të ri
  print('\n=== SHTIMI I PRODUKTIT TË RI ===');
  dyqani.addProduct(Product(5, 'Kufje', 29.99));
  dyqani.printAllProducts();
  
  // Test shtesë: Kërkojmë në rangun 20.0 - 30.0
  print('\n=== KËRKIMI NË RANGUN 20.0 - 30.0 ===');
  List<Product> produkteNeRange3 = dyqani.inPriceRange(20.0, 30.0);
  
  if (produkteNeRange3.isEmpty) {
    print('Nuk u gjet asnjë produkt në rangun 20.0 - 30.0');
  } else {
    print('Produktet në rangun 20.0 - 30.0:');
    for (Product product in produkteNeRange3) {
      print(product);
    }
  }
}
