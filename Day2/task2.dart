class Product {
  int id;
  String name;
  double price;

  Product(this.id, this.name, this.price);

  @override
  String toString() {
    return 'Product(id: $id, name: $name, price: $price)';
  }
}


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

void main() {

  addProduct(Product(1, 'Laptop', 1200.0));
  addProduct(Product(2, 'Mouse', 25.5));
  addProduct(Product(3, 'Keyboard', 50.0));
  addProduct(Product(4, 'Monitor', 300.0));

  print('--- Të gjitha produktet ---');
  store.forEach((p) => print(p));


  bool uFshi = removeById(2);
  print('\nU fshi produkti me id=2? $uFshi');


  List<Product> interval = inPriceRange(100, 500);
  print('\n--- Produktet me çmim 100-500 ---');
  interval.forEach((p) => print(p));
}
