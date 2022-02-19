
# Week 3
This week focuses on the following features
1. Classes
   1. constructors
   2. private and static vars
   3. inheritance
   4. mixins
   5. interfaces
   6. extensions
2. Asynchronous programming


# Excercises
Exercise 1.
You are implementing very simple animals for a farming/crafting game.
The animals get updated each tick, 30 ticks per second.
A full day ingame represents 180000 ticks.
They have the following behaviour:

```
void fly()
void swim()
void walk()
void donothing()
```
The animals can swim, fly, and/or walk. This is needed for interaction (so the animals can do stuff on screen) as well as for making sure that the correct enclosure is used to house them. (e.g. ducks in a cage, cows in a field surrounded by a fence, etc) When an animal does one of these actions, tiredness increases by 1 and hunger increases by 1.25 per tick. Animals can also do nothing, which increases hunger and tiredness by 0.5 per tick.
They do this action for some random time between 30 and 750 ticks. For this duration, callling `someAnimal.status()` should return a `fly, swim, walk, nothing`  Status.
Meaning that fly, etc sets a timer inside the instance and for the duration of that timer, the animal returns whatever that animal is doing.

The following enum class will be defined for you which you may use:
```dart
enum Status {
   fly,
   swim,
   walk,
   doNothing,
   eat,
   reproduce,
   rest,
   dead
}
```

`void eat(Food food)`
The animals need to be fed with the correct food type. Eating decreases their hunger by 6000. If their hunger reaches 10000, they die.
if they eat the wrong food (if the player has placed the incorrect type of food in their enclosure to eat), an exception should be raised.
Animals eat between 60 and 120 ticks, and for this duration, calling `.status()` should return `Status.eat`

`void reproduce(Animal animal)`
Animals are able to reproduce when they reach maturity (measured in ticks). They produce either an Egg, or another instance of their class. They produce this after a specified time, and these can be aqcuired with the next function described.
Animals reproduce between 60 and 120 ticks, and for this duration, calling `.status()` should return `Status.reproduce`
If animal is not the same type as the class, raise an exception. if the animal is not mature, or If they are the same type, but also the same sex, raise an exception.
while it's reproducing, tiredness and hunger increase by 2 per tick.


`List<Item> farm()`
You can aquire items from animals. Items such as baby animals, eggs, milk, wool, etc.
All the items they produce have a timer associated with them. EG, you can only get milk every 18000 ticks from a cow.

`void rest()`
Animals need to rest at the corrrect time (nocturnal or Diurnal) or when their tiredness reaches 1000. if this reaches 0, they die. There will be a global variable called TIME which will be between 00 and 23, which you can use to check the time of the day.
Animals sleep for a duration between 5250 and 6000 ticks, and for this duration, calling status returns `Status.reproduce`.

`void makenoise()`
The animals can make noise. Print an appropriate noise. The animal does this for a duration of less than 60 ticks. calling status during this time returns `Status.doNothing`



`void update(List<Food> availableFood, List<Animal> animals_in_enclosure)`
every tick, this function is called. It chooses one of the following things to do:
eat: if it's hunger is above 8000. if there's no appropriate food available for the animal, it does not eat, and will die when hunger reaches 10000.
sleep: if it's tiredness is above 8000, or if it's their appropriate time to sleep (7-18 is daytime, 19-6 is nighttime)
a random choice of whichever of the following it can do: fly, walk, do nothing, swim, reproduce, makenoise
Keep in mind that actions increase hunger and tiredness. if either of these reaches 10000, the animal dies.
If it dies, `.status()` will always return `Status.dead` and the update loop should do nothing from then on.


`Status status()`
returns the status of the animal. is it walking, flying, doing nothing, dead, etc.

constructors:
For the sake of simplicity, the only 2 constructors each animal needs is the default one, and one that accepts (int age_ticks, Sex sex, Status status).
the status of a default constructed animal before update is run is `Status.doNothing`.


The following things will be made available for you:


```dart
abstract class Item{}

abstract class Food extends Item{}
abstract class None extends Food{}
abstract class CarnivorousFood extends Food{};
abstract class HerbivorousFood extends Food{};
class Grass extends CarnivorousFood{};
class Grain extends CarnivorousFood{};
class Fish extends HerbivorousFood{};
class Kibble extends CarnivorousFood{};

abstract class FarmableItems extends Item{};
class CowMilk extends FarmableItem{};
class SheepMilk extends FarmableItem{};
class Wool extends FarmableItem{};
class Egg extends FarmableItem{};
... need to add some more

You need to implement the following animals with this behaviour:

Cow:
reaches maturity after x ticks
produces little cow x ticks after reproduce() is used
can produce cowmilk every x ticks
is diurnal
is a herbivore
can walk
goes Moooo

Sheep:
reaches maturity after x ticks
produces little sheep x ticks after reproduce() is called
can produce sheepmilk every x ticks
can produce wool every x ticks
is diurnal
can walk
goes Beeeeee

Chicken:
reaches maturity after x ticks
produces eggs x ticks after reproduce() is called
is diurnal
can walk
goes cuck cluck

Duck:
reaches maturity after x ticks
produces eggs x ticks after reproduce() is called
is diurnal
can walk
can fly
goes quack quack

Platypus (why not)
reaches maturity after x ticks
produces eggs x ticks after reproduce is called
is diurnal
can walk
can swim
goes errrrrrrrrrr



1 dag = 180000 ticks
1 uur = 750 ticks

hunger = 10000
cutoff = 80000
hunger = ~12 * 750 * 1.25 = ~11250
food = 3x6000
sleep = 8 * 750 * 1.6 = 10000