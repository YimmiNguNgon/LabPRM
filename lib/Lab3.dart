import 'dart:async';
import 'dart:convert';


Future<void> main() async {
  print('==START== \n');

  await exercise1_ProductRepository();
  await exercise2_UserRepository();
  exercise3_MicrotaskDebugging();
  await exercise4_StreamTransformation();
  exercise5_FactoryConstructor();

  print('\n ==END== ');
}

/*
   EXERCISE 1 – PRODUCT MODEL & REPOSITORY
   Goal: Understand Futures and Streams
*/

/// Product data model
class Product {
  final int id;
  final String name;
  final double price;

  Product(this.id, this.name, this.price);

  @override
  String toString() {
    return 'Product(id: $id, name: $name, price: $price)';
  }
}

class ProductRepository {

  final List<Product> _products = [
    Product(1, 'Laptop', 1200),
    Product(2, 'Phone', 800),
  ];


  final StreamController<Product> _controller =
  StreamController<Product>.broadcast();


  Future<List<Product>> getAll() async {
    // Simulate network delay
    await Future.delayed(Duration(seconds: 1));
    return _products;
  }


  Stream<Product> liveAdded() {
    return _controller.stream;
  }


  void addProduct(Product product) {
    _products.add(product);
    _controller.add(product);
  }
}

Future<void> exercise1_ProductRepository() async {
  print('Exercise 1: Product Model & Repository');

  final repo = ProductRepository();

  // Listen to real-time product stream
  repo.liveAdded().listen((product) {
    print('Live added product: $product');
  });


  final products = await repo.getAll();
  print('Initial product list:');
  for (var p in products) {
    print(p);
  }


  repo.addProduct(Product(3, 'Tablet', 600));

  await Future.delayed(Duration(milliseconds: 500));
  print('');
}

/*
   EXERCISE 2 – USER REPOSITORY WITH JSON
   Goal: JSON serialization & deserialization
*/

class User {
  final String name;
  final String email;

  User({required this.name, required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
    );
  }

  @override
  String toString() {
    return 'User(name: $name, email: $email)';
  }
}

Future<List<User>> fetchUsers() async {
  const String jsonResponse = '''
  [
    {"name": "Alice", "email": "alice@mail.com"},
    {"name": "Bob", "email": "bob@mail.com"}
  ]
  ''';

  await Future.delayed(Duration(seconds: 1));

  final List decodedJson = jsonDecode(jsonResponse);

  return decodedJson.map((e) => User.fromJson(e)).toList();
}

Future<void> exercise2_UserRepository() async {
  print('--- Exercise 2: User Repository with JSON ---');

  final users = await fetchUsers();
  for (var user in users) {
    print(user);
  }

  print('');
}

/*
   EXERCISE 3 – ASYNC + MICROTASK DEBUGGING
   Goal: Understand Event Queue vs Microtask Queue
*/

void exercise3_MicrotaskDebugging() {
  print('--- Exercise 3: Async & Microtask Debugging ---');

  print('Start');

  scheduleMicrotask(() {
    print('Microtask 1');
  });

  Future(() {
    print('Event task 1');
  });

  scheduleMicrotask(() {
    print('Microtask 2');
  });

  print('End');

  /*
  Expected execution order:
  Start
  End
  Microtask 1
  Microtask 2
  Event task 1

  Explanation:
  - Dart executes synchronous code first
  - Then clears all microtasks
  - Finally processes event queue (Future callbacks)
  */

  print('');
}

/*
   EXERCISE 4 – STREAM TRANSFORMATION
   Goal: map() and where()
*/

Future<void> exercise4_StreamTransformation() async {
  print('--- Exercise 4: Stream Transformation ---');

  final Stream<int> numberStream = Stream.fromIterable([1, 2, 3, 4, 5]);

  numberStream
      .map((n) => n * n)
      .where((n) => n.isEven)
      .listen((value) {
    print('Stream output: $value');
  });

  await Future.delayed(Duration(milliseconds: 500));
  print('');
}

/*
   EXERCISE 5 – FACTORY CONSTRUCTORS & CACHE
   Goal: Singleton pattern
*/

class Settings {
  static final Settings _instance = Settings._internal();
  Settings._internal();
  factory Settings() {
    return _instance;
  }
}
void exercise5_FactoryConstructor() {
  print('--- Exercise 5: Factory Constructor & Singleton ---');
  final a = Settings();
  final b = Settings();
  print('Are both instances identical? ${identical(a, b)}');
}
