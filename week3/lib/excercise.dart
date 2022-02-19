enum Status { fly, swim, walk, doNothing, eat, reproduce, rest, dead }
enum Sex { female, male }

abstract class Item {}

abstract class Food extends Item {}

abstract class None extends Food {}

abstract class CarnivorousFood extends Food {}

abstract class HerbivorousFood extends Food {}

class Grass extends CarnivorousFood {}

class Grain extends CarnivorousFood {}

class Fish extends HerbivorousFood {}

class Kibble extends CarnivorousFood {}

abstract class FarmableItem extends Item {}

class CowMilk extends FarmableItem {}

class SheepMilk extends FarmableItem {}

class Wool extends FarmableItem {}

class Egg extends FarmableItem {}

// Feel free to modify anything in this
class Animal extends Item {
  void eat(Food food) {}
  void reproduce(Animal animal) {}
  List<Item> farm() {
    return [];
  }

  void rest() {}
  void makeNoise() {}
  void update(List<Food> availableFood, List<Animal> animals_in_enclosure) {}
  Status status() {
    return Status.doNothing;
  }
}

// create your abstractions. use inheritance, composition, mixins, interfaces. Your only constraint is that
// Animal needs to be in the inheritance tree somewhere (CowInstance is Animal must return true, for example)

// Cow:
// reaches maturity after 900000 ticks
// produces little cow 360000 ticks after reproduce() is used
// can produce cowmilk every 180000 ticks
// is diurnal
// is a herbivore
// can walk
// goes Moooo
class Cow {}

// Sheep:
// reaches maturity after 900000 ticks
// produces little sheep 360000 ticks after reproduce() is called
// can produce sheepmilk every 180000 ticks
// can produce wool every 360000 ticks
// is diurnal
// can walk
// goes Beeeeee
class Sheep {}

// Chicken:
// reaches maturity after 450000 ticks
// produces eggs 180000 ticks after reproduce() is called
// is diurnal
// can walk
// goes cuck cluck
class Chicken {}

// Duck:
// reaches maturity after 450000 ticks
// produces eggs 180000 ticks after reproduce() is called
// is diurnal
// can walk
// can fly
// goes quack quack
class Duck {}

// Platypus
// reaches maturity after 1200000 ticks
// produces eggs 360000 ticks after reproduce is called
// is diurnal
// can walk
// can swim
// goes errrrrrrrrrr
class Platypus {}

bool test_classes() {
  List<Animal> animals = [];
  animals.add(Cow());
  animals.add(Sheep());
  animals.add(Chicken());
  animals.add(Duck());
  animals.add(Platypus());

  for (int i = 0; i < animals.length; i++) {
    if (animals[i].status() != Status.doNothing) {
      print("Status is not Status.doNothing\n");
      return false;
    }
  }

  return true;
}
