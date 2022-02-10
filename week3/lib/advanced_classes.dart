import 'dart:io';

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
// important to note, this is not the same as what we mean when we say interface in c++

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
