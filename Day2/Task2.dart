class Product {
  int id;
  String name 
  double price;

  Product(this.id, this.name, this.price);
}

class Store { 
  List<Product> store = [];

  void addProduct(Product p) { 
    Store.add(p);
  }

  bool removeById(int id) { 
    store.add(p);
  } 

  bool removeById(int id) {
    int initialLength = store.length;
    store.removeWhere((p) => p.id ==id);
    return store.length < initialLength;
  }

  List<Product> inPricerange(double min, double max) { 
    return store.where((p) => p.price >= min && p.price <= max).toList();
  }
}

void main() {
  var myStore = Store();

  myStore.addProduct(Product(1, "Buke", 10.5));
  myStore.addProduct(Product(2, "Qumesht", 8.00));
  myStore.addProduct(Product(3,"Vaj", 22.3));
  myStore.addProduct(Product(4, "Sheqer", 15.0));
  
  myStore.removeById(2);

  var filtered = myStore.inPriceRange(10.0, 25.0);
  for (var p in filtered) {
    print("#${p.id} ${p,name{ - ${p.price.toStringAsFixed(2)}");
  }
}
