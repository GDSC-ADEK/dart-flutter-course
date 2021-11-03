import 'dart:core';
import 'package:characters/characters.dart';
import 'dart:math';
/*
  This is a block comment
  */

// clarification van laatste week, ik weet niet of ik dit moet behandelen
void const_vs_final() {
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
  // mylist2 = [""]; // * but you can't reassign
  print(mylist2);

  var mylist3 = const [""];
  // if a container is const, it's items are recursively const as well
  // mylist3[0] = "It changed"; // * this will throw an exception
  // mylist3.add("insert surprisedpikachu.jpg"); // * this as well
  mylist3 = ["ahah"]; // * maar je kan wel reassignen
  print(mylist3);
}

void math_operators1() {
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

void math_operators2() {
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

void increment_decrement() {
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

void logical_and_relational_operators() {
  var a = true && false; // and
  var b = true || false; //or
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
  var isAdult;
  if (age > 18) {
    isAdult = true;
  } else {
    isAdult = false;
  }

  print("a= $a,b=$b, c=$c, d=$d, e=$e, f=$f, g=$g, h=$h, i=$i");

  var j = 10;
  // if (j) { // * will throw an error
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
  family = "this is a" + family;
  print(family);
  var someString = "This Is A String";
  print(someString.toLowerCase());
  print(someString.toUpperCase());
  // substring
  print(someString.substring(0, 10));
  // find first and last occurence of substring
  var another = "a substring is a part of a string.";
  var substring = "string";
  var first_pos = another.indexOf(substring);
  var last_pos = another.lastIndexOf(substring);
  print("first = $first_pos, last= $last_pos");
  print(another.substring(first_pos, first_pos + substring.length));
  print(another.substring(last_pos, last_pos + substring.length));
  // indexOf and lastIndexOf return -1 when not found
  print(another.indexOf("sagar"));
  // they also take regex
  var url_reg = RegExp(r"([\w\-\d]+\.{1})+\w+(\:\d+)?[\w/\d\%\.]+");
  var url = "The page is sramsaransing.com/projects/awesomeProj.html";
  var startpos = url.indexOf(url_reg);
  print(url.substring(startpos, url.length));
  // you can replace
  url = url.replaceAll("page", "email");
  url = url.replaceAll(url_reg, "email@fake.com");
  print(url);
  // you can split by some delimiter
  var sentence = "this is a sentence";
  var words = sentence.split(" ");
  print(words);
}

enum Weather { rain, sun, snow, unknown } // a bit like scoped enums in c++
// they have to be top level, not in classes or functions.

void control_flow() {
  var rng = new Random();
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
  // there's also the forEach, but it doesn't work on strings.
  // it does work on other collections
  var first_primes = [2, 3, 5, 7, 11, 13, 17];
  first_primes.forEach((prime) {
    print(prime);
  });

  first_primes.forEach((prime) => print(prime));
  // there's the while and do while loop, just like C++

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

void functions() {
  bool isBreakTime(DateTime now) {
    var begin = DateTime(2021, 11, 6, 16, 0, 0, 0);
    var end = DateTime(2021, 11, 6, 16, 15, 0, 0);
    return begin.isBefore(now) && end.isAfter(now);
  }

  // ignore the line below, it is to hide a warning on how to do something.
  // ignore: prefer_function_declarations_over_variables
  Function isBreakTime2 = (DateTime now) {
    var begin = DateTime(2021, 11, 6, 16, 0, 0, 0);

    var end = DateTime(2021, 11, 6, 16, 15, 0, 0);
    return begin.isBefore(now) && end.isAfter(now);
  };

  isBreakTime(DateTime.now());
  isBreakTime2(DateTime.now());
}
