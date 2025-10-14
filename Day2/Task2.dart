class Product {
  int id;
  String name;
  double price;

  Product(this.id, this.name, this.price);
}

class Store {
  List<Product> store = [];

  // Shton produkt në listë
  void addProduct(Product p) {
    store.add(p);
  }

  // Fshin produkt sipas id-së, kthen true nëse fshihet
  bool removeById(int id) {
    return store.removeWhere((p) => p.id == id) > 0;
  }

  // Kthen listën e produkteve brenda një intervali çmimi
  List<Product> inPriceRange(double min, double max) {
    return store.where((p) => p.price >= min && p.price <= max).toList();
  }
}

void main() {
  Store mySt
