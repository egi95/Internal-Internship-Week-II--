class Product {
  int id;
  String name;
  double price;

  // Konstruktor
  Product(this.id, this.name, this.price);
}

class Store {
  List<Product> store = [];

  // Shton një produkt në listë
  void addProduct(Product p) {
    store.add(p);
  }

  // Fshin një produkt sipas id dhe kthen true nëse fshihet
  bool removeById(int id) {
    int initialLength = store.length;
    store.removeWhere((product) => product.id == id);
    return store.length < initialLength;
  }

  // Kthen listën e produkteve në intervalin e çmimeve
  List<Product> inPriceRange(double min, double max) {
    return store.where((product) => product.price >= min && product.price <= max).toList();
  }
}

void main() {
  // Krijimi i instancës së Store
  Store store = Store();

  // Shtimi i 4 produkteve
  store.addProduct(Product(1, 'Laptop', 999.99));
  store.addProduct(Product(2, 'Mouse', 19.99));
  store.addProduct(Product(3, 'Tastierë', 49.99));
  store.addProduct(Product(4, 'Kufje', 24.99));

  // Fshirja e produktit me id=2
  bool isRemoved = store.removeById(2);
  print('Produkti me id=2 u fshi: $isRemoved');

  // Marrja e produkteve në intervalin e çmimeve 10.0–25.0
  List<Product> productsInRange = store.inPriceRange(10.0, 25.0);

  // Printimi i produkteve në formatin e kërkuar
  for (var product in productsInRange) {
    print('#${product.id} ${product.name} - ${product.price.toStringAsFixed(2)}');
  }
}
