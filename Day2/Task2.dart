class Product {
  int id;
  String name;
  double price;

  Product(this.id, this.name, this.price);

  @override
  String toString() => "($id) $name - ${price.toStringAsFixed(2)} €";
}

// "Repo" në memorie
class Store {
  List<Product> store = [];

  // Shton një produkt në listë
  void addProduct(Product p) {
    store.add(p);
  }

  // Fshin produktin sipas id-së, kthen true nëse u fshi diçka
  bool removeById(int id) {
    return store.removeWhere((p) => p.id == id) > 0;
  }

  // Kthen produktet brenda intervalit të çmimeve
  List<Product> inPriceRange(double min, double max) {
    return store.where((p) => p.price >= min && p.price <= max).toList();
  }
}

void main() {
  // Krijojmë instancën e "Store"
  Store s = Store();

  // Shtojmë disa produkte
  s.addProduct(Product(1, "Laptop", 899.99));
  s.addProduct(Product(2, "Mouse", 25.50));
  s.addProduct(Product(3, "Monitor", 199.90));
  s.addProduct(Product(4, "Keyboard", 45.00));

  print("Produkte në fillim:");
  s.store.forEach(print);

  // Fshijmë një produkt sipas id-së
  bool uFshi = s.removeById(2);
  print("\nProdukt me ID 2 u fshi? $uFshi");

  // Shfaqim produktet pas fshirjes
  print("\nProdukte pas fshirjes:");
  s.store.forEach(print);

  // Gjejmë produktet në një interval çmimi
  print("\nProdukte me çmim midis 100 dhe 500 €:");
  var interval = s.inPriceRange(100, 500);
  interval.forEach(print);
}
