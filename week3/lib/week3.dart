//! constructors

class User {
  User(int id, String username, String password) {
    // somewhat discouraged, don't know why
    // long form constructor
    this.id = id;
    this.username = username;
    this.password = password;
  }

// downside of having only the long form constructor
// is that dart thinks there is a possibility that values won't be initialized
// so you have to assign values to them
  int id = 0;
  String username = "";
  String password = "";

  @override // @something is an annotation.
  String toString() {
    return '{id: $id, name: $username, password: $password}';
  }
}

// short form, named constructors, and delegating constructors
class User2 {
  User2(this.id, this.username, this.password); // short form
  User2.stubUser() {
    // named constructors
    id = -1;
    username = "not a user";
    password = "";
  }
  // ^ that is not DRY
  // we could forward the arguments to the already existing constructor
  User2.stubUser2() : this(-1, "not a user", "");
  int id = 0;
  String username = "";
  String password = "";
  @override
  String toString() {
    return '{id: $id, name: $username, password: $password}';
  }
}

//! private members, and list initialisation

class User3 {
  // User3(
  //     { this._id,
  //      this._username,
  //      this._password}); // * ERROR

// use list initialisation, or the long constructor for that,
// because the short formis not allowed to initialize private vars
  User3({id, username, password})
      : _id = id,
        _username = username,
        _password = password;

  int _id; // als python dunder methods
  String _username;
  String _password;
  // ^ make members "library private"
  // all code in the library can modify these vars.
  @override
  String toString() {
    return '{id: $_id, name: $_username, password: $_password}';
  }
}

// final and const, again

class User4 {
  // since all members are final, you can change nothing about the class
  // after construction so mark the constructor as const
  // this has both readability benefits and occasional performance benefits
  const User4({id, username, password})
      : _id = id,
        _username = username,
        _password = password;
  // you can set the members as final, so you can't change them after initialisation
  final int _id;
  final String _username;
  final String _password;
  @override
  String toString() {
    return '{id: $_id, name: $_username, password: $_password}';
  }
}

// getters and setters

class Rectangle {
  //.. constructors
  double _length = 0;
  double _width = 0;
  // getters
  double get length => _length;
  double get width => _width;
  double get volume =>
      _length * _width; // they can also do it for calculated values
  // although IMO just use a normal function when you're doing that
  // setters
  set length(double l) {
    if (l < 0) {
      throw Exception("length needs to be positive");
    }
    _length = l;
  }

  set width(double w) {
    if (w < 0) {
      throw Exception("width needs to be positive");
    }
    _width = w;
  }
}

// static variables
// these are variables that belong to the class, not the instance. So however many instances you create
// the static var will be referencing the same value.
// static fieldsd are lazy evaluated, they are only calculated and assigned when needed
class Fruit {
  static int fruitsCreated = 0;
  static int fruitsEaten = 0;
  Fruit() {
    fruitsCreated++;
  }
  static void eat() {
    print('nom nom!');
    fruitsEaten++;
  }
}

//! singletons
// singletons are classes where you only ever create one instance of
// an example is something like a database connection

class Database {
  Database._()
      : _url =
            "https://mysitedb:200"; // private named constructor, so you can't instantiate it normally
// a static var that contains the one instance allowed
  static final Database instance = Database._();
  String _url; // imagine this contains important state
}

// an even better way to create a singleton, with a factory constructor
// factory constructors
// while normal constructors return new instances of the class, factory constructors
// can return existing instances, and subclasses
class Database2 {
  Database2._() : _url = "https://mysitedb:200";
  static final Database2 _instance = Database2._();
  factory Database2() => _instance;
  String _url;
}

void removeUnusedWarning(
    [Object? v1, Object? v2, Object? v3, Object? v4, Object? v5, Object? v6]) {}

void constructors() {
  // As can be seen from the printed output, the constructors do the same thing
  var u1 = User(1, "sagar", "thisisaweakpassword!");
  print(u1.toString());
  var u2 = User2(1, "sagar", "thisisaweakpassword!");
  print(u2.toString());
  // the delegating constructors.
  // as can be seen, these 2 produce the same end result
  var stub = User2.stubUser();
  print(stub.toString());
  var stub2 = User2.stubUser2();
  print(stub2.toString());

  // before i forget, something you might see in dart code:
  var notAStub = User2.stubUser() // cascade notation
    ..id = 1
    ..username = "sagar"
    ..password = "weakpassword";
  print(notAStub.toString());

  // new is not needed since dart 2.0
  // so these are identical (since dart 2.0!)
  var user1 = new User2.stubUser();
  var user2 = User2.stubUser();
  print(user1.toString());
  print(user2.toString());
}

void privateVarsGetterSetters() {
  var u3 = User3(id: 1, username: "sagar", password: "weakpw");
  print(u3._id); // can be accesed from within the library,
  // since it is outside the library, it is not allowed to access _id
  var u4 = User4(id: 1, username: "sagar", password: "weakpw");
  // u4._id = 5; // *ERROR, since it is final, I can't change it

  // ! getters and setters
  var myRect = Rectangle();
  myRect.length = 50; // setter usage
  // myRect.length = -50;
  // ^ This will throw an exception, since the setter does some additional checking
  var length = myRect.length;
  print(myRect.length);
  myRect.width = 100;
  print(myRect.volume);

  removeUnusedWarning(u4, length);
}

void staticVars() {
  int x = Fruit.fruitsEaten;
  Fruit.eat();
  print(Fruit.fruitsEaten);
  var myfruit1 = Fruit();
  var myfruit2 = Fruit();
  var myfruit3 = Fruit();
  print("fruit instances created: ${Fruit.fruitsCreated}");
  print("Fruit eaten: ${Fruit.fruitsEaten}");

// You are not allowed to call static vars through instances
  // aFruit.fruitsEaten; // * Error
  // aFruit.eat(); //* Error

  // static vars used for singletons
  // these refer to the same thing, the static instance
  var db1 = Database.instance;
  var db2 = Database.instance;
  var db3 = Database.instance;

  // but it is better to use a factory constructor, because it allows you to "create"
  // them just like normal classes
  var dba = Database2();
  var dbb = Database2();

  removeUnusedWarning(myfruit1, myfruit3, myfruit2, x);
  removeUnusedWarning(db1, db2, db3, dba, dbb);
}
