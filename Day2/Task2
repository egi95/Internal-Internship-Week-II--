// task2.dart

class Product {
  int id;
  String name;
  double price;

  Product(this.id, this.name, this.price);
}

// Repo në memorie
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
  // 1. Shto 4 produkte
  addProduct(Product(1, 'Bukë', 12.50));
  addProduct(Product(2, 'Qumësht', 8.00));
  addProduct(Product(3, 'Vaj', 15.75));
  addProduct(Product(4, 'Djathë', 22.00));

  // 2. Fshi produktin me id = 2
  bool fshire = removeById(2);
  print(fshire ? 'Produkti me ID 2 u fshi.' : 'Produkti me ID 2 nuk u gjet.');

  // 3. Merr produktet në intervalin 10.0 - 25.0
  List<Product> filtruar = inPriceRange(10.0, 25.0);

  // 4. Printo produktet
  for (var p in filtruar) {
    print('#${p.id} ${p.name} - ${p.price.toStringAsFixed(2)}');
  }
}
