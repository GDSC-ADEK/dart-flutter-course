import 'dart:core';
import 'dart:math';

import 'package:characters/characters.dart';
import 'package:collection/collection.dart';

/*
  This is a block comment
  */
// normal comment
/// documentation comment.

// clarification van laatste week, ik weet niet of ik dit moet behandelen
void constVsFinal() {
  const mylist = [""];
  // if a container is const, it and its items are recursively immutable as well
  // mylist[0] = "It changed"; // * this will throw an exception
  // mylist.add("insert surprisedpikachu.jpg"); // * this as well
  // mylist = [""]; // * you can't reassign a new list
  print(mylist);

  final mylist2 = [""];
  // the items are not recussively immutable
  mylist2[0] = "It changed";
  mylist2.add("insert surprisedpikachu.jpg");
  // mylist2 = [""]; // * but you can't reassign a new list to it
  print(mylist2);

  var mylist3 = const [""];
  // if a container is const, it's items are recursively const as well
  // mylist3[0] = "It changed"; // * this will throw an exception
  // mylist3.add("insert surprisedpikachu.jpg"); // * this as well
  mylist3 = ["ahah"]; // * maar je kan wel reassignen
  print(mylist3);

  // const is only for compile-time constants
  // meaning you can only use them when the value is known at compile time
  // assigning a random number, the current time, or the return of some API
  // are examples of non compile-time constants
  // const date = DateTime.now(); // * can't be assigned
  final date = DateTime.now();
  // guideline: if you know something is not going to get reassigned a new value
  // prefer to use either const or final. If it's a compile time constant, use const.
}

void arithmeticOperators1() {
  int y = 100 - 12;
  int z = 100 + 12;
  int a = 100 * 12;
  double b = 100 / 12;
  int d = 100 % 12;
  int c = 100 ~/ 12; //* trunk operator
  // * het is als `c = 100 // 12` in python
  // * of c =  (int) 100 / 12

  print("""
    y = $y
    z = $z
    a = $a
    b = $b
    c = $c
    d = $d
    """);
}

void arithmeticOperators2() {
  double x = 100;
  x -= 12;
  x += 12;
  print("x -=12  en daarna += 12 = $x");
  x *= 2;
  x /= 2;
  print("x *2 en /2 = $x");
  int y = 100;
  y ~/= 3;
  print("y ~/= 3 = $y");
}

void incrementDecrement() {
  int x = 1;
  var y = x++; // postfix
  print("y = $y, x = $x");
  y = x--;
  print("y = $y, x = $x");

  y = --x; // prefix
  print("y = $y, x = $x");
  y = ++x;
  print("y = $y, x = $x");
}

void logicalAndRelationalOps() {
  var a = true && false; // and
  var b = false || true; //or
  var c = !true; // not
  var d = true == true;
  var e = true != false;
  var f = 5 < 6;
  var g = 6 > 5;
  var h = 5 <= 6;
  var i = 7 >= 5;
  var age = 20;
  var ageLt18 = (age > 18) ? true : false;
  // ternary operator, equivalent to
  bool isAdult;
  if (age > 18) {
    isAdult = true;
  } else {
    isAdult = false;
  }

  print("a= $a,b=$b, c=$c, d=$d, e=$e, f=$f, g=$g, h=$h, i=$i");
  print("$isAdult, $ageLt18");

  // if (age) { // * will throw an error
  //   print("ints cast cast down to bool");
  // }

  Function toBool = (int x) => (x == 0) ? false : true;

  var number = 10;
  if (toBool(number)) {
    print("make a function to do it for you");
  }
}

void strings() {
  /*
  strings worden opgeslagen als utf-16 codepoints, just like in javascript.
  */
  var family = '👨🏼‍👨🏼‍👦🏼‍👦🏼';
  print(" number of utf16 code points: ${family.length}");
  print("number of human readable characters: ${family.characters.length}");

  var multiline = """
  this is a multiline string.
  You do it by adding 3 single or double qoutes on each end.
  """;
  print(multiline);
  // long strings that aren't multiline
  print(
      // you don't need to + concatenate them when splitting long strings like this
      // in fact, it is recomended not to.
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod "
      "tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim"
      " veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea "
      "commodo consequat. Duis aute irure dolor in reprehenderit in voluptate "
      "velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat "
      "cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id "
      "est laborum.");
  family = "this is a" + family;
  // ^ another thing that's not recomended:
  //prefer interpolation ("blah blah $family") over concatenation
  print(family);
  var someString = "This Is A String";
  print(someString.toLowerCase());
  print(someString.toUpperCase());
  // substring
  print(someString.substring(0, 10));
  // find first and last occurence of substring
  var another = "a substring is a part of a string.";
  var substring = "string";
  var firstPos = another.indexOf(substring);
  var lastPos = another.lastIndexOf(substring);
  print("first = $firstPos, last= $lastPos");
  print(another.substring(firstPos, firstPos + substring.length));
  print(another.substring(lastPos, lastPos + substring.length));
  // indexOf and lastIndexOf return -1 when not found
  print(another.indexOf("sagar"));
  // they also take regex
  var urlReg = RegExp(r"([\w\-\d]+\.{1})+\w+(\:\d+)?[\w/\d\%\.]+");
  var url = "The page is sramsaransing.com/projects/awesomeProj.html";
  var startpos = url.indexOf(urlReg);
  print(url.substring(startpos, url.length));
  // you can replace
  url = url.replaceAll("page", "email");
  url = url.replaceAll(urlReg, "email@fake.com");
  print(url);
  // you can split by some delimiter
  var sentence = "this is a sentence";
  var words = sentence.split(" ");
  print(words);
}

void collections() {
  // dart calls data structures collections.
  // some syntaxic sugar to declare collection types, since collections are used so much
  var points = <Point>[Point(1, 2), Point(2, 2)]; // list
  var addresses = <String, double>{"sagar": 1, "lorenzo": 2}; // map
  var counts = <int>{5, 8, 3445, 89}; // set
  // quick note
  // dart does not compare equality between collections
  var a = ["a", "b"];
  var b = ["a", "b"];
  print(a == b); // false
  // to do it correctly
  // import 'package:collection/collection.dart';
  Function eq = const DeepCollectionEquality().equals;
  print(eq(a, b)); // true

  // DO add type names for type safety, if you start with an empty collection
  var myList = []; // don't. Gets the type List<Dynamic>
  var myBetterList = ["Duck"]; // gets List<String>
  List<String> myBetterList2 = []; // gets List<String>
  var myBetterList3 = <int>[]; //gets List<int>

  // list methods
  myBetterList.add("Frog");
  myBetterList.remove("Duck");
  myBetterList.add("Sheep");
  myBetterList.removeAt(0);
  print(myBetterList[0]);
  var letters = ["a", "b", "c", "d", "e", "f"];
  print(letters.sublist(1, 3));
  // ^ left inclusive, right exclusive

  var drinks = ['water', 'milk', 'juice', 'soda'];
  // you can concatenate lists
  drinks += ["beer", "wine", "dawet"];
  print(drinks.first);
  drinks.sort();
  print(drinks.last);
  print(drinks.isEmpty);
  print(drinks.isNotEmpty);
  print(drinks.length);
  // guidance: do NOT use .length to check for emptyness.
  // the collections are not required to know it in O(1) time.
  // it can be slow for large collections.
  // use .isEmpty or .isNotEmpty, whichever does not require you to ! negate it

  // spread operator
  var mammals = ["monkeys", "cats", "dogs"];
  var animals = ["doves", ...mammals, "jellyfish"];
  print(animals);
  List<String>? mammals2; // currently null
  // animals = [ ...mammals2, "jellyfish"]; // * Don't if nullable
  animals = ["doves", ...?mammals2, "jellyfish"]; // do this instead
  // it will only try to include it if it knows mammals2 is not null
  print(animals);

// collection if
  const peanutAllergy = true;
  const candy = [
    'Mars',
    'bubblegum',
    if (!peanutAllergy) 'Snickers',
  ];
  print(candy);
// collection for
  const deserts = ['gobi', 'sahara', 'arctic'];
  var bigDeserts = [
    'ARABIAN',
    for (var desert in deserts) colorizeConsoleText(desert),
  ];
  print(bigDeserts);

  // looping over lists
  // these are equivalent
  for (int i = 0; i < drinks.length; i++) {
    printColorizedConsoleText(drinks[i]);
  }
  for (var drink in drinks) {
    printColorizedConsoleText(drink);
  }
  drinks.forEach((drink) => printColorizedConsoleText(drink));

  drinks.forEach(printColorizedConsoleText);

  // sets
  // a collection of unordered unique elements
  var primes = {1, 2, 3, 5, 7, 11};
  primes.add(13);
  primes.addAll([17, 19, 23]);
  primes.remove(1);
  print(primes);
  print(primes.contains(3)); // does 3 exist in primes
  var odd = <int>{1, 3, 5, 7, 9, 11, 13};
  print(primes.intersection(odd)); //elements that are odd and prime
  print(primes.union(odd)); // elements that are odd or prime
  // want to know if any item in some collection is in some other collection
  var importantNums = {1, 2, 3, 4, 5};
  print(importantNums.intersection(primes).isNotEmpty); // prints true
  // heeft ook de collection for, collection if, en spread operators
}

void collections2() {
  final Map<String, double> grades = {
    "Sagar": 8.8,
    "Lorenzo": 9.0,
    "Dernz": 10.0
  };
  grades["Sagar"];
  print(grades["notAPerson"]); // returns null if key doesn't exist
  grades["NotAPerson"] = 8.7;
  grades.remove("NotAPerson");
  print(grades.keys);
  print(grades.values);
  print(grades.containsKey("Shane")); // check if exists
  print(grades.containsValue(10.0));

  // looping
  // for (var person in grades) { //* Does not work
  //   print(grades[person]);
  // }
  for (var person in grades.keys) {
    // use this
    print(grades[person]);
  }
  grades.forEach((key, value) => print('$key ->$value')); // or this
  // or this
  for (final entry in grades.entries) {
    print('${entry.key} -> ${entry.value}');
  }

  // const vs final
  // final prevents you from reassigning a new collection to a var
  // but does not prevent you from modifying the collection itself
  // if you want a list that can't be changed
  // final is kinda like `int * const x = someptr` in c/c++, where you can modify the
  // pointed to object, but you can't reassign the pointer to point to something else
  //
  //const is like `int const * const x = someptr` in c/c++, you can neither reassign the
  //pointer or change the value of the thing it points to

  // there is a problem if you want a nonmodifyable list, but the content is not a compile time constant
  // you can do this in that case
  var rng = Random();
  // const unmodList = [rng.nextInt(100)]; //* error
  final modifiableList = [rng.nextInt(100), rng.nextInt(200)];
  final unmodifiableList = List.unmodifiable(modifiableList);
  // unfortunately, trying to edit a unmodifiable object will give a runtime error
  // and not a compile time error
}

enum Weather { rain, sun, snow, unknown } // a bit like scoped enums in c++
// they have to be top level, not in classes or functions.

void controlFlow() {
  var rng = Random();
  var today = Weather.values[rng.nextInt(4)];
  // imagine it pulled this data from some weather api instead
  if (today == Weather.rain) {
    print("Bring an umbrellla.");
  } else if (today == Weather.sun) {
    print("Don't forget to put on sunscreen");
  } else if (today == Weather.snow) {
    print("Where your snowboots at, bruh");
  } else {
    print("idk, you figure it out");
  }
  // equivalent to this statement, for those who forgot it existed
  switch (today) {
    case Weather.rain:
      {
        print("Bring an umbrellla.");
        break;
      }
    case Weather.sun:
      {
        print("Don't forget to put on sunscreen");
        break;
      }
    case Weather.snow:
      {
        print("Where your snowboots at, bruh");
        break;
      }
    default:
      {
        print("idk, you figure it out");
      }
  }

  // for loops, the different versions
  const myString = 'I ❤ Dart';
  for (var codePoint in myString.runes) {
    print(String.fromCharCode(codePoint));
  }

  for (int i = 0; i < myString.runes.length; i++) {
    print(myString[i]);
  }
  // there's also the forEach, only for collections
  myString.runes.forEach((rune) {
    print(String.fromCharCode(rune));
    // although, it is more intended to be used
    // by passing .forEach(someFunction)
  });
  // same, but with arrow syntax.
  myString.runes.forEach((rune) => print(String.fromCharCode(rune)));

  // there's the while and do while loop as well, just like C++

  bool isPrime(int n) => true;
  //^ imagine this actually checks if a number is prime
  int counter = 999;
  for (int i = 3; i < 1000000; i += 2) {
    if (!isPrime(i)) {
      continue;
    }
    counter--;
    if (counter == 0) {
      print("1000th prime is $i");
      break;
    }
  }
}

void functions1() {
  bool isBreakTime(DateTime now) {
    var begin = DateTime(2021, 11, 13, 17, 0, 0, 0);
    var end = DateTime(2021, 11, 13, 17, 15, 0, 0);
    return begin.isBefore(now) && end.isAfter(now);
  }

  Function isBreakTime2 = (DateTime now) {
    var begin = DateTime(2021, 11, 13, 17, 0, 0, 0);
    var end = DateTime(2021, 11, 13, 17, 15, 0, 0);
    return begin.isBefore(now) && end.isAfter(now);
  };

  bool isBreakTime3(DateTime now) =>
      DateTime(2021, 11, 13, 17, 0, 0, 0).isBefore(now) &&
      DateTime(2021, 11, 13, 17, 15, 0, 0).isAfter(now);
  // return_type fnct_name(parameters) => expression;
  // you usually use those for quick oneliner functions
  // ^ that doesn't fit reasonably on a line, so you'd rather use the method employed in isBreakTime2

  isBreakTime(DateTime.now());
  isBreakTime2(DateTime.now());
  isBreakTime3(DateTime.now());
}

void functions2() {
  // how to make parameters optional
  String fullName(String first, String last, [String? title]) {
    if (title != null) {
      return '$title $first $last';
    } else {
      return '$first $last';
    }
  }

  // Or even better, assigning sane defaults to them
  bool withinTolerance(int value, [int min = 0, int max = 10]) {
    return min <= value && value <= max;
  }

  print(withinTolerance(10));
  print(fullName("Sagar", "Ramsaransing"));

  // function with named parameters
  bool withinTolerance2(int value, {int min = 0, int max = 10}) {
    return min <= value && value <= max;
  }

  // now you must name the parameters when calling the function
  withinTolerance(5, 3, 7); // ok
  withinTolerance2(5, min: 3, max: 7); // ok
  withinTolerance2(5); // ok
  // withinTolerance2(5, 3,7); // * error

  // what if you want named parameters but not optional ones?
  bool withinTolerance3({required int value, required int min, required max}) {
    return min <= value && value <= max;
  }

  withinTolerance3(value: 5, min: 3, max: 7); // ok
  // withinTolerance3(5, 3, 7); //* error
  // withinTolerance3(5); //* error
}

void functions3() {
  // functions as first class citizens
  // functions are objects that can be assigned to variables
  String blueFont(String mystring) {
    return "\x1B[34m" + mystring + "\x1B[0m";
  }

  String greenBg(String mystring) {
    return "\u001b[42m" + mystring + "\u001b[0m";
  }

  print("Sagar");
  print(blueFont("Sagar"));
  print(greenBg("Sagar"));
  // functions can be passed to functions
  String colorizeText(
      {required String myString,
      required Function fontColor,
      required Function bgColor}) {
    return fontColor(bgColor(myString));
  }

  print(colorizeText(
      myString: "This is cool", fontColor: blueFont, bgColor: greenBg));

  bool isEven(int n) => n % 2 == 0;
  int square(int n) => n * n;
  var someNumbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  var squaredEvenNums = someNumbers.where(isEven).map(square).toList();
  // ^ toList, because map and where return iterables, which can then
  // be converted to sets, lists, etc
  print(squaredEvenNums);
  // you can reduce down an iterable
  var total = squaredEvenNums.reduce((sum, element) => sum + element);
  print(total);
  // but prefer fold over reduce, because it works on empty iterables
  // while reduce doesn't
  List<int> nums = [];
  var total2 = nums.fold(
    0,
    (int sum, element) => sum + element,
  );
  print(total2);
}

void closures() {
  // anonymous functions are closures, and have access to surrounding scope
  // useful for creating functions that return functions
  Function maxClipper(int clipAt) {
    return (int value) {
      return (value > clipAt) ? clipAt : value;
    };
  }

  var clipper5volt = maxClipper(5);
  print(clipper5volt(10));
  print(clipper5volt(2));
}

class User {
  int id;
  String name;

  // default, long form constructor
  // User(int id, String name) {
  //   this.id = id;
  //   this.name = name;
  // }

  // short form constructor
  User(this.id, this.name);

  @override
  String toString() {
    return 'User(id: $id, name: $name)';
  }

  String toJson() {
    return '{"id":$id,"name":"$name"}';
  }
}

// ignore these
String colorizeConsoleText(String myString) {
  return "\u001b[42m\x1B[34m" + myString + "\x1B[0m\u001b[0m";
}

void printColorizedConsoleText(String myString) {
  print("\u001b[42m\x1B[34m" + myString + "\x1B[0m\u001b[0m");
}
