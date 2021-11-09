import "dart:math";

// sample solution
int sumPrimes() {
  bool isPrime(int n) {
    if (n < 4) {
      // 2,3 are prime
      return n > 1;
    }
    if (n % 2 == 0) return false; // uneven is not prime
    double max = sqrt(n);
    for (int i = 3; i <= max; i += 2) {
      // i = 3,5,7
      if (n % i == 0) {
        return false;
      }
    }
    return true;
  }

  int sum = 0;
  var nPrimes = 0;
  int i = 1;
  while (nPrimes < 1000) {
    if (isPrime(i)) {
      sum += i;
      nPrimes++;
    }
    i++;
  }
  return sum;
}

List<List<String>> exercise2(
    List<String> person, List<List<String>> foodItems) {
  var personal = person.toSet(); // transform to a set
  // transform each List<String> to a Set<String>
  var foods = foodItems.map((foodAlergens) => foodAlergens.toSet());
  // filter the sets where there's overlap between personal alergens and the ones the food contains
  var dangerous = foods.where((food) => personal.intersection(food).isNotEmpty);
  // transform Iterator<Set<String>> to List<List<String>> and return it
  return dangerous.map((e) => e.toList()).toList();
}

bool exercise3(String isbn) {
  const char2Value = {
    "0": 0,
    "1": 1,
    "2": 2,
    "3": 3,
    "4": 4,
    "5": 5,
    "6": 6,
    "7": 7,
    "8": 8,
    "9": 9,
    "x": 10
  };
  // remove spaces and -, lowercase it
  isbn = isbn.replaceAll(" ", "").replaceAll("-", "").toLowerCase();
  // split in list of chars, and reverse it
  var charList = isbn.split("").reversed;
  // map the letters to their values
  var charVals = charList.map((char) => char2Value[char]).toList();
  // loop over the values, and multiply by index + 1
  int sum = 0;
  for (int i = 0; i < charList.length; i++) {
    sum += (i + 1) * (charVals[i] as int);
  }
  return sum % 11 == 0;
}
