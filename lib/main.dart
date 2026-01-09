import 'dart:async';

void main() async {
  print("===== EXERCISE 1 =====");
  exercise1();

  print("\n===== EXERCISE 2 =====");
  exercise2();

  print("\n===== EXERCISE 3 =====");
  exercise3();

  print("\n===== EXERCISE 4 =====");
  exercise4();

  print("\n===== EXERCISE 5 =====");
  await exercise5();
}

//////////////////////////////////////////////////
// Exercise 1 – Basic Syntax & Data Types
//////////////////////////////////////////////////
void exercise1() {
  // Declare basic data types
  int age = 20;
  double gpa = 3.6;
  String name = "Huy";
  bool isStudent = true;

  // Print using string interpolation
  print("Name: $name");
  print("Age: $age");
  print("GPA: $gpa");
  print("Is student: $isStudent");
  print("Age next year: ${age + 1}");
}

//////////////////////////////////////////////////
// Exercise 2 – Collections & Operators
//////////////////////////////////////////////////
void exercise2() {
  // List
  List<int> numbers = [1, 2, 3];
  numbers.add(4);
  numbers.remove(2);

  print("List: $numbers");
  print("First element: ${numbers[0]}");

  // Operators
  int a = 10, b = 5;
  print("a + b = ${a + b}");
  print("a > b && b > 0 = ${a > b && b > 0}");

  // Ternary operator
  String result = a == b ? "Equal" : "Not equal";
  print(result);

  // Set
  Set<int> uniqueNumbers = {1, 2, 2, 3};
  print("Set: $uniqueNumbers");

  // Map
  Map<String, int> scores = {
    "Math": 9,
    "English": 8,
  };
  scores["Physics"] = 10;

  print("Map: $scores");
  print("Math score: ${scores["Math"]}");
}

//////////////////////////////////////////////////
// Exercise 3 – Control Flow & Functions
//////////////////////////////////////////////////
void exercise3() {
  int score = 85;

  // if / else
  if (score >= 90) {
    print("Excellent");
  } else if (score >= 70) {
    print("Good");
  } else {
    print("Needs improvement");
  }

  // switch case
  int day = 3;
  switch (day) {
    case 1:
      print("Monday");
      break;
    case 2:
      print("Tuesday");
      break;
    case 3:
      print("Wednesday");
      break;
    default:
      print("Invalid day");
  }

  // Loops
  List<int> nums = [1, 2, 3];

  for (int i = 0; i < nums.length; i++) {
    print("for: ${nums[i]}");
  }

  for (int n in nums) {
    print("for-in: $n");
  }

  nums.forEach((n) {
    print("forEach: $n");
  });

  // Functions
  print("Add: ${add(3, 4)}");
  print("Multiply: ${multiply(3, 4)}");
}

// Normal function
int add(int a, int b) {
  return a + b;
}

// Arrow function
int multiply(int a, int b) => a * b;

//////////////////////////////////////////////////
// Exercise 4 – Intro to OOP
//////////////////////////////////////////////////
void exercise4() {
  Car car = Car("Toyota");
  ElectricCar tesla = ElectricCar("Tesla");

  print(car.start());
  print(tesla.start());
}

// Base class
class Car {
  String brand;

  // Constructor
  Car(this.brand);

  // Named constructor
  Car.unknown() : brand = "Unknown";

  String start() {
    return "$brand car is starting";
  }
}

// Subclass
class ElectricCar extends Car {
  ElectricCar(String brand) : super(brand);

  // Override method
  @override
  String start() {
    return "$brand electric car is starting silently";
  }
}

//////////////////////////////////////////////////
// Exercise 5 – Async, Future, Null Safety & Streams
//////////////////////////////////////////////////
Future<void> exercise5() async {
  // Async & await
  print("Loading...");
  String data = await fetchData();
  print(data);

  // Null safety
  String? name;
  print(name ?? "Name is null");

  name = "Huy";
  print(name!.toUpperCase());

  // Stream
  Stream<int> stream = countStream();
  stream.listen((value) {
    print("Stream value: $value");
  });
}

Future<String> fetchData() async {
  return Future.delayed(
    Duration(seconds: 2),
        () => "Data loaded successfully",
  );
}

Stream<int> countStream() async* {
  for (int i = 1; i <= 3; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}
