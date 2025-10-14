// Task 2 – Inventar i thjeshtë produktesh

class Product {
  int id;
  String name;
  double price;

  Product(this.id, this.name, this.price);

  @override
  String toString() => 'ID: $id | $name - ${price.toStringAsFixed(2)}€';
}

class Store {
  List<Product> store = [];

  // Shton një produkt në listë
  void addProduct(Product p) {
    store.add(p);
  }

  // Fshin produktin sipas ID dhe kthen true nëse u fshi diçka
  bool removeById(int id) {
    return store.removeWhere((p) => p.id == id) > 0;
  }

  // Kthen produktet që janë në një interval çmimesh
  List<Product> inPriceRange(double min, double max) {
    return store.where((p) => p.price >= min && p.price <= max).toList();
  }
}

void main() {
  Store myStore = Store();

  // Shtimi i disa produkteve
  myStore.addProduct(Product(1, 'Laptop', 899.99));
  myStore.addProduct(Product(2, 'Mouse', 19.50));
  myStore.addProduct(Product(3, 'Monitor', 150.00));
  myStore.addProduct(Product(4, 'Keyboard', 45.00));

  // Fshirja e një produkti
  bool removed = myStore.removeById(2);
  print(removed ? 'Produkti me ID 2 u fshi.' : 'Nuk u gjet produkti.');

  // Produktet në një interval çmimesh
  double minPrice = 40;
  double maxPrice = 200;
  List<Product> rangeProducts = myStore.inPriceRange(minPrice, maxPrice);

  print('\nProduktet midis ${minPrice}€ dhe ${maxPrice}€:');
  for (var p in rangeProducts) {
    print(p);
  }
}
