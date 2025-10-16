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
  
  Store s = Store();

  
  s.addProduct(Product(1, "Pencil", 5.0));
  s.addProduct(Product(2, "Notebook", 12.5));
  s.addProduct(Product(3, "Marker", 22.0));
  s.addProduct(Product(4, "Bag", 40.0));

  
  bool removed = s.removeById(2);
  print(removed ? "Produkti me id=2 u fshi." : "Produkti me id=2 nuk u gjet.");

  
  List<Product> filtered = s.inPriceRange(10.0, 25.0);

  print("\nProduktet me çmim 10.0 - 25.0:");
  for (var p in filtered) {
    print("#${p.id} ${p.name} - ${p.price.toStringAsFixed(2)}");
  }
}

