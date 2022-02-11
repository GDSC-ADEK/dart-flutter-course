import 'dart:io';
import "dart:math";

abstract class Person {
  Person(this.givenName, this.surname);
  String givenName;
  String surname;
  String get fullName => '$givenName $surname';
  @override
  String toString() => fullName;
}

class Student extends Person {
  Student(String givenName, String surname, Map<String, double> grades)
      : grades = grades,
        super(givenName, surname);
  //^ super() constructor needs to be the last in this
  Map<String, double> grades;
  @override
  String toString() => "$fullName, grades=$grades";
}

class FaseVertegenwoordiger extends Student {
  FaseVertegenwoordiger(String givenName, String surname,
      Map<String, double> grades, String class_)
      : representing = class_,
        super(givenName, surname, grades);
  String representing;
  @override
  String toString() => "$fullName, grades=$grades, representing $representing";
}

class Assistant extends Student {
  Assistant(String givenName, String surname, Map<String, double> grades,
      List<String> assisting)
      : assistingFor = assisting,
        super(givenName, surname, grades);
  List<String> assistingFor;
  @override
  String toString() => super.toString() + ", assisting for $assistingFor";
}

//! interfaces
// these are similar to inheritance, with several differences
// 1. You have to define the methods in the class using the interface
// 2. inheritance has a "is a (type of)" association
// while interfaces are (like) composition. a class has an interface.
// 3. Since only the methods are important, the interface  doesn't contain logic
// Interfaces are often made with abstract classes for this reason
//

abstract class CityDataRepository {
  double? fetchAvgTemperature(String city);
  double? fetchAvgPercipitation(String city);
  double? fetchAvgIncome(String city);
}

class FakeWebServer implements CityDataRepository {
  // ... internals related to FakeWebServer

  @override
  double? fetchAvgTemp(String city) {
    return 42.0;
  }

  @override
  double? fetchAvgIncome(String city) {
    return 1;
  }

  @override
  double? fetchAvgPercipitation(String city) {
    // TODO: implement fetchAvgPercipitation
    return 1;
  }

  @override
  double? fetchAvgTemperature(String city) {
    // TODO: implement fetchAvgTemperature
    return 1;
  }
}

//! Mixins
// a way to add functionality to classes
// without having to reimplement the same code over and over again
abstract class Animal {
  void eat() {
    print("nom nom");
  }

  void sleep() {
    print("zzzzz");
  }
}

mixin EggLayer {
  int lainEggs = 0;
  void layEggs() {
    print('Plop plop');
    lainEggs++;
  }
}
mixin Flyer {
  void fly() {
    print('Swoosh swoosh');
  }
}
mixin ProduceMilk {
  void giveMilk() {}
}

class Bird extends Animal with EggLayer {} // not all birds fly

class Mammal extends Animal with ProduceMilk {}

class Platypus extends Mammal with EggLayer {}

class Dove extends Bird with Flyer {}

class Ostrich extends Bird {}

// ! extensions
// a way to add functionality to existing classes, without creating new classes
// or modifying the actual class where it is defined.

// without extensions: you have to create a wrapper
class Int {
  Int(int i) : _i = i;
  get sq => _i * _i;
  int _i;
}

// with extensions
extension on int {
  get sq => this * this;

  // you can do this, but don't
  @override
  get isOdd => !this.isOdd;
}

void inheritance() {
  String name = "Sagar";
  String surname = "Ramsaransing";
  Map<String, double> grades = {
    "Analyse 1": 8,
    "Lin. Alg.": 8,
    "Diff. Eq.": 6,
    "Intro Compsci": 9,
    "OOP": 8
  };
  List<String> assist = ["Intro Compsci", "OOP"];

  // Person sagar = Person(name, surname); //* ERROR: not allowed to instantiate abstract classes
  Student sagar = Student(name, surname, grades);
  print(sagar);
  Assistant sagarAssist = Assistant(name, surname, grades, assist);
  print(sagarAssist);
  FaseVertegenwoordiger fasevertegenwoordiger =
      FaseVertegenwoordiger(name, surname, grades, "FTeW_ET 2018");
  print(fasevertegenwoordiger);

  // inferred type of collections containing polymorphic types
  // it automatically selects the type that's the nearest common superclass
  var students = [sagar, sagarAssist, fasevertegenwoordiger];
  print(students.runtimeType);
  for (var element in students) {
    print(element);
  }

  // to check if an object is a class or subclass of something
  print("sagarAssist is a student: ${sagarAssist is Student}");
  print("sagarAssist is a student: ${sagarAssist is Assistant}");

  // object slicing
  // print(students[1].assistingFor); // * ERROR: A Student does not have an assistingFor
  print((students[1] as Assistant).assistingFor);
  print("sagarAssist is a student: ${students[1] is Student}");
  print("sagarAssist is a student: ${students[1] is Assistant}");
  var x = students[1];
  print(x.runtimeType);
}

void interfaces() {
  var myWebServer = FakeWebServer();
  myWebServer.fetchAvgIncome("Paramaribo");
}

void mixins() {
  var myDove = Dove();
  var perry = Platypus();
  var myOstrich = Ostrich();
  myDove.fly();
  // myOstrich.fly(); // * ERROR, ostriches don't fly
  perry.layEggs();
  print(perry.lainEggs);
  print("perry is egglayer: ${perry is EggLayer}");
}

void extensions() {
  var x = 100;
  print(x.sq);
  var y = Int(100);
  print(y.sq);
  // why it is bad to override in extensions
  // someone looking at your code would expect a certain behaviourr that does
  // not necesarily match reality
  print("is x odd? ${x.isOdd}");
}
