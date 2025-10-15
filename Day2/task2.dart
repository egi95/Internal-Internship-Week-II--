void main() {
  // Krijojmë një listë për ruajtjen e produkteve
  List<Product> store = [];

  // Shto produkte
  addProduct(store, Product(1, 'Bukë', 8.5));
  addProduct(store, Product(2, 'Qumësht', 12.0));
  addProduct(store, Product(3, 'Vaj', 25.5));
  addProduct(store, Product(4, 'Sheqer', 18.9));

  print('--- Produktet fillestare ---');
  printProducts(store);

  // Fshijmë produktin me id = 2
  bool removed = removeById(store, 2);
  print('\nProdukt me id=2 ${removed ? 'u fshi.' : 'nuk u gjet.'}');

  print('\n--- Pas fshirjes ---');
  printProducts(store);

  // Marrim produktet në interval çmimi 10.0 - 25.0
  List<Product> filtered = inPriceRange(store, 10.0, 25.0);

  print('\n--- Produktet me çmim nga 10.0 deri në 25.0 ---');
  printProducts(filtered);
}

// ----------------------
// Klasa Product
// ----------------------
class Product {
  int id;
  String name;
  double price;

  Product(this.id, this.name, this.price);
}

// ----------------------
// Funksionet e inventarit
// ----------------------

void addProduct(List<Product> store, Product p) {
  store.add(p);
}

bool removeById(List<Product> store, int id) {
  for (int i = 0; i < store.length; i++) {
    if (store[i].id == id) {
      store.removeAt(i);
      return true;
    }
  }
  return false;
}

List<Product> inPriceRange(List<Product> store, double min, double max) {
  List<Product> result = [];
  for (Product p in store) {
    if (p.price >= min && p.price <= max) {
      result.add(p);
    }
  }
  return result;
}

// ----------------------
// Printimi i produkteve
// ----------------------

void printProducts(List<Product> store) {
  if (store.isEmpty) {
    print('(Nuk ka produkte)');
  } else {
    for (Product p in store) {
      print('#${p.id} ${p.name} - ${p.price.toStringAsFixed(2)}');
    }
  }
}
