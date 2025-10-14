// Klasa Product
class Product {
  int id;
  String name;
  double price;

  Product(this.id, this.name, this.price);
}

// Lista globale e produkteve
List<Product> store = [];

// Funksion per te shtuar produkt
void addProduct(Product p) {
  store.add(p);
}

// Funksion per te fshire produkt sipas id
bool removeById(int id) {
  int count = store.length;
  store.removeWhere((p) => p.id == id);
  return store.length < count; // true nese diçka u fshi
}

// Funksion per te gjetur produktet ne nje range cmimesh
List<Product> inPriceRange(double min, double max) {
  return store.where((p) => p.price >= min && p.price <= max).toList();
}

void main() {
  // Shtojme disa produkte
  addProduct(Product(1, 'Libri', 12.5));
  addProduct(Product(2, 'Karrigia', 30.0));
  addProduct(Product(3, 'Fshese', 20.0));
  addProduct(Product(4, 'Blete', 15.0));

  // Fshijme produktin me id = 2
  bool fshi = removeById(2);
  print(fshi ? 'Produkti u fshi me sukses.' : 'Produkti nuk u gjet.');

  // Marrim produktet ne range cmimesh 10.0 - 25.0
  List<Product> selected = inPriceRange(10.0, 25.0);

  // Printojme rezultatet
  print('Produktet ne range 10.0-25.0:');
  for (var p in selected) {
    print('#${p.id} ${p.name} - ${p.price.toStringAsFixed(2)}');
  }
}
