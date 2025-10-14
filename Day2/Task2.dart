class Product {
  int id;
  String name;
  double price;

  Product(this.id, this.name, this.price);
}

// Repo në memorie
List<Product> store = [];

// Funksioni për shtimin e produktit
void addProduct(Product p) {
  store.add(p);
}

// Funksioni për fshirjen e produktit sipas id
bool removeById(int id) {
  for (int i = 0; i < store.length; i++) {
    if (store[i].id == id) {
      store.removeAt(i);
      return true;
    }
  }
  return false;
}

// Funksioni për marrjen e produkteve në një interval çmimesh
List<Product> inPriceRange(double min, double max) {
  List<Product> result = [];
  for (var p in store) {
    if (p.price >= min && p.price <= max) {
      result.add(p);
    }
  }
  return result;
}

void main() {
  // Shtimi i disa produkteve
  addProduct(Product(1, 'Laptop', 30.0));
  addProduct(Product(2, 'Mouse', 15.0));
  addProduct(Product(3, 'Keyboard', 20.0));
  addProduct(Product(4, 'Mousepad', 5.0));

  // Fshirja e produktit me id=2
  bool removed = removeById(2);
  print('Produkt i fshirë: $removed');

  // Marrja e produkteve në intervalin 10.0–25.0
  List<Product> selected = inPriceRange(10.0, 25.0);

  if (selected.isEmpty) {
    print('Nuk ka produkte në këtë interval.');
  } else {
    for (var p in selected) {
      print('#${p.id} ${p.name} - ${p.price.toStringAsFixed(2)}');
    }
  }
}

