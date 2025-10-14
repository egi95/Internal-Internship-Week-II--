import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class Product {
  int id;
  String name;
  double price;

  Product(this.id, this.name, this.price);

  String toString() {
    return "#$id $name - ${price.toStringAsFixed(2)}";
  }
}

class Store {
  List<Product> store = [];

  void addProduct(Product p) {
    store.add(p);
  }

  bool removeById(int id) {
    int initialLength = store.length;
    store.removeWhere((p) => p.id == id);
    return store.length < initialLength;
  }

  List<Product> inPriceRange(double min, double max) {
    return store.where((p) => p.price >= min && p.price <= max).toList();
  }
}

void main() {
  Store myStore = Store();

  myStore.addProduct(Product(1, "Laps", 9.99));
  myStore.addProduct(Product(2, "Libër", 15.50));
  myStore.addProduct(Product(3, "Çantë", 20.00));
  myStore.addProduct(Product(4, "Kalkulator", 30.00));

  bool uFshi = myStore.removeById(2);
  print("U fshi produkti me id 2? $uFshi\n");

  List<Product> filtered = myStore.inPriceRange(10.0, 25.0);

  for (var produkt in filtered) {
    print(produkt);
  }
}
