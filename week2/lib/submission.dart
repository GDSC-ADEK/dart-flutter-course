import "dart:math";

// implement the function
int sumPrimes() {
  var de_som_van_de_priemgetallen = 0;
  const int SIZE = 1000;

  for (int i = 0; i < SIZE; i++) {
    for (int j = 2; j < i; j++) {
      if (i % j == 0) {
        de_som_van_de_priemgetallen += i;
      }
    }
  }

  print(de_som_van_de_priemgetallen);
  return de_som_van_de_priemgetallen;
}

// implement the function
List<List<String>> exercise2(
    List<String> person, List<List<String>> foodItems) {
  var dangerousFoods = <List<String>>[];
  return dangerousFoods;
}

// implement the function
bool exercise3(String isbn) {
  return true;
}
