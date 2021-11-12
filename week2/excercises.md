

# Instructions
Go to [./lib/submission.dart](./lib/submission.dart) It contains 3 unimplemented functions, one for each excercise.
Implement them.

# Excercise 1
Expected time to complete: 10- 15 mins.  

A prime is a number that's divisible by _exactly_ 2 numbers: 1 and itself.
This means that 1 is not a prime.
Implement a function that returns the sum of the first 1000 primes.



# Excercise 2
Expected time to complete: 10 mins.  

Make a function that accepts `List<String>` and a `List<List<String>>` as arguments.
The first argument will be a list of strings, each string representing an ingredient  a person is allergic to (an alergen).  
Each nested list in the 2nd list represents a food item, and each string inside it represents an allergen it contains.
the function should return a list of the food items the person is allergic to.  

interface of your expected function:
```
List<List<String>> exercise2(List<String> person, List<List<String>> foodItems);
```

example input and output:
```
1st argument: ['sesame seeds', 'shellfish']
2nd argument: [ [],
  ['sesame seeds', 'rice'],
  ['tree nuts'],
  ['shellfish', 'fish'],
  ['sesame seeds', 'eggs'],
  [],
  [],
  ['rice'],
  [],
  ['eggs']]
output : [['sesame seeds', 'rice'], ['shellfish', 'fish'], ['sesame seeds', 'eggs']]
```




# Excercise 3
Expected time to complete: ~15 mins.   

The ISBN-10 verification process is used to validate book identification numbers. 
These may contain dashes or spaces as seperator.
The ISBN-10 format is 9 digits (0 to 9) plus one check character (either a digit or an X only, not both). In the case the check character is an X, this represents the value '10'.
A few examples of valid isbn-10 identifiers:
```
0-587-35505-0
0 9984849 7 0
0 262-36085 3
```

To check wether a given identifier is valid, the following formula is used
`(pos1 * 10 + pos2 * 9 + pos3 * 8 + pos4 * 7 + pos5 * 6 + pos6 * 5 + pos7 * 4 + pos8 * 3 + pos9 * 2 + pos10 * 1) mod 11 == 0`

Let's take the ISBN-10 `3-598-21508-8`. We plug it in to the formula, and get:
```
(3 * 10 + 5 * 9 + 9 * 8 + 8 * 7 + 2 * 6 + 1 * 5 + 5 * 4 + 0 * 3 + 8 * 2 + 8 * 1) mod 11 == 0
```
Since the result is 0, the identifier is valid.
Your task is to write a function that takes in an isbn10 string, and return true/false wether it is valid or not.

Pass your function to the ex3Checker like so: `checkers.ex3Checker(myFunction);`



