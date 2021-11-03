import 'dart:core';
import 'package:characters/characters.dart';

/*
  This is a block comment
  */

// clarification van laatste week, ik weet niet of ik dit moet behandelen
void const_vs_final() {
  const mylist = [""];
  // if a container is const, it and its items are recursively immutable as well
  // mylist[0] = "It changed"; // this will throw an exception
  // mylist.add("insert surprisedpikachu.jpg"); // this as well
  // mylist = [""]; you can't reassign a new list
  print(mylist);

  final mylist2 = [""];
  // the items are not recussively immutable
  mylist2[0] = "It changed";
  mylist2.add("insert surprisedpikachu.jpg");
  // mylist2 = [""]; // but you can't reassign
  print(mylist2);

  var mylist3 = const [""];
  // if a container is const, it's items are recursively const as well
  // mylist3[0] = "It changed"; // this will throw an exception
  // mylist3.add("insert surprisedpikachu.jpg"); // this as well
  mylist3 = ["ahah"]; // maar je kan wel reassignen
  print(mylist3);
}

void math_operators1() {
  int y = 100 - 12;
  int z = 100 + 12;
  int a = 100 * 12;
  double b = 100 / 12;
  int c = 100 ~/ 12;
  // ^ het is als `c = 100 // 12` in python, of `int c = 100/ 12` in c++.
  int d = 100 % 12;
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
  var y = x++;
  print("y = $y, x = $x"); // postfix
  y = x--;
  print("y = $y, x = $x");
  y = --x;
  print("y = $y, x = $x"); // prefix
  y = ++x;
  print("y = $y, x = $x");
}

void strings() {
  /*
  strings worden opgeslagen als utf-16 codepoints, just like in javascript.
  */
  var family = '👨🏼‍👨🏼‍👦🏼‍👦🏼';
  print("${family.length}, ${family.characters.length}");
  family = "this is a" + family;
  print(family);
  var multiline = """
  this is a multiline string.
  You do it by adding 3 single or double qoutes on each end.
  """;
  print(multiline);
  ;
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

  var ageLt18 = (age > 18) ? true : false; // ternary operator, equivalent to

  var isAdult;
  if (age > 18) {
    isAdult = true;
  } else {
    isAdult = false;
  }

  print("a= $a,b=$b, c=$c, d=$d, e=$e, f=$f, g=$g, h=$h, i=$i");
  var j = 0;
  // if (j) { // will throw an error
  //   print("ints don't cast down to bool");
  // }
}
