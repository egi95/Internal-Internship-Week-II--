class Product {
  int id;
  String name;
  double price;


  Product(this.id, this.name, this.price);


  void info() {
    print("ID: $id | Emri: $name | Çmimi: €${price.toStringAsFixed(2)}");
  }
}


class Store {
  List<Product> store = [];

  void addProduct(Product p) {
    store.add(p);
    print("Produkti '${p.name}' u shtua me sukses!");
  }


  bool removeById(int id) {
    for (var p in store) {
      if (p.id == id) {
        store.remove(p);
        print("Produkti me ID $id u fshi me sukses!");
        return true;
      }
    }
    print("Asnjë produkt me ID $id nuk u gjet!");
    return false;
  }


  List<Product> inPriceRange(double min, double max) {
    List<Product> result = [];
    for (var p in store) {
      if (p.price >= min && p.price <= max) {
        result.add(p);
      }
    }
    return result;
  }


  void showAll() {
    print("\n Produktet aktuale në dyqan:");
    for (var p in store) {
      p.info();
    }
  }
}

void main() {

  var myStore = Store();


  myStore.addProduct(Product(1, "Laptop", 899.99));
  myStore.addProduct(Product(2, "Mouse", 25.50));
  myStore.addProduct(Product(3, "Keyboard", 49.90));
  myStore.addProduct(Product(4, "Monitor", 220.00));

 
  myStore.showAll();


  myStore.removeById(2);


  print("\n Produktet me çmim 50€ - 300€:");
  var range = myStore.inPriceRange(50, 300);
  for (var p in range) {
    p.info();
  }
}
