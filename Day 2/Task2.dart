class Product {
  final int id;
  final String name;
  final double price;

  
  Product({
    required this.id,
    required this.name,
    required this.price,
  });

  
  @override
  String toString() {
    return 'Product(id: $id, name: $name, price: \$$price)';
  }
}

class ProductRepository {
 
  final List<Product> _store = [];

  
  List<Product> get store => _store;

 
  void addProduct(Product p) {
    
    if (_store.any((product) => product.id == p.id)) {
      print('Warning: Product with ID ${p.id} already exists. Not adding.');
      return;
    }
    _store.add(p);
    print('Product added: ${p.name}');
  }

  
  bool removeById(int id) {
   
    int initialLength = _store.length;
    _store.removeWhere((product) => product.id == id);

    bool deleted = _store.length < initialLength;
    if (deleted) {
      print('Product with ID $id successfully removed.');
    } else {
      print('Product with ID $id not found.');
    }
    return deleted;
  }

  
  List<Product> inPriceRange(double min, double max) {
    // Use the 'where' method to filter the list based on the price condition.
    return _store
        .where((product) => product.price >= min && product.price <= max)
        .toList();
  }
}


void main() {
  
  final repo = ProductRepository();

 
  print('--- Adding Products ---');
  repo.addProduct(Product(id: 101, name: 'Laptop', price: 1200.00));
  repo.addProduct(Product(id: 102, name: 'Mouse', price: 25.50));
  repo.addProduct(Product(id: 103, name: 'Monitor', price: 350.00));
  repo.addProduct(Product(id: 104, name: 'Keyboard', price: 75.99));
  print('\nAll current products:');
  repo.store.forEach(print);
  
  
  print('\n--- Deleting Product (ID 102) ---');
  bool wasRemoved = repo.removeById(102); 
  print('Removal status: $wasRemoved');

  print('\n--- Deleting non-existent Product (ID 999) ---');
  bool notRemoved = repo.removeById(999);
  print('Removal status: $notRemoved');
  
  
  double minPrice = 50.00;
  double maxPrice = 400.00;
  
  print('\n--- Products in Price Range (\$${minPrice} - \$${maxPrice}) ---');
  List<Product> affordableProducts = repo.inPriceRange(minPrice, maxPrice);

  if (affordableProducts.isNotEmpty) {
    affordableProducts.forEach(print);
  } else {
    print('No products found in this price range.');
  }

  print('\nFinal list of products in the store:');
  repo.store.forEach(print);
}
