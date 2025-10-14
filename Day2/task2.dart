// task2.dart

class Product {
  int id;
  String name;
  double price;

  Product(this.id, this.name, this.price);
}

class Store {
  List<Product> store = [];

  // Shton një produkt të ri
  void addProduct(Product p) {
    store.add(p);
  }

  // Fshin produktin sipas ID-së, kthen true nëse u fshi diçka
  bool removeById(int id) {
    return store.removeWhere((p) => p.id == id) > 0;
  }

  // Kthen produktet që janë brenda një intervali çmimi
  List<Product> inPriceRange(double min, double max) {
    return store.where((p) => p.price >= min && p.price <= max).toList();
  }

  // Printon të gjitha produktet
  void printAll() {
    for (var p in store) {
      print('#${p.id} ${p.name} - ${p.price.toStringAsFixed(2)}');
    }
  }
}

void main() {
  var myStore = Store();

  // Shtojmë disa produkte
  myStore.addProduct(Product(1, 'Ujë', 10.0));
  myStore.addProduct(Product(2, 'Lëng', 15.5));
  myStore.addProduct(Product(3, 'Bukë', 5.0));
  myStore.addProduct(Product(4, 'Djathë', 22.3));

  print('--- Lista fillestare ---');
  myStore.printAll();

  // Fshijmë produktin me id = 2
  print('\nDuke fshirë produktin me ID = 2...');
  bool removed = myStore.removeById(2);
  print(removed ? 'Produkti u fshi me sukses.' : 'Produkti nuk u gjet.');

  // Printojmë listën pas fshirjes
  print('\n--- Pas fshirjes ---');
  myStore.printAll();

  // Marrim produktet me çmim 10.0 – 25.0
  print('\n--- Produktet me çmim 10.0–25.0 ---');
  var filtered = myStore.inPriceRange(10.0, 25.0);
  for (var p in filtered) {
    print('#${p.id} ${p.name} - ${p.price.toStringAsFixed(2)}');
  }
}
