import 'dart:math';

class DiceRoller {
  static List rollDice(int number, int sides) {
    var diceList = [];
    for (int i = 0; i < number; i++) {
      diceList.add(rollDie(sides));
    }
    return diceList;
  }

  static List rollDiceWithModifier(int number, int sides, int modifier) {
    var diceList = [];
    for (int i = 0; i < number; i++) {
      diceList.add(rollDie(sides));
    }

    diceList.add(modifier);

    return diceList;
  }

  static int rollDie(int sides) {
    return Random().nextInt(sides) + 1;
  }

  static int rollNumberBetween(int min, int max) {
    return min + Random().nextInt((max + 1) - min);
  }

  static int rollDiceDropLowest(int number, int sides) {
    var diceList = rollDice(number, sides);
    int lowest = sides;
    int sum = 0;
    for (int i in diceList) {
      if (i < sides) lowest = i;
      sum += i;
    }
    return sum -= lowest;
  }

  static List roll4d6(){
    return rollDice(4, 6);
  }

  static List roll3d6(){
    return rollDice(3, 6);
  }

  static List roll2d6(){
    return rollDice(2, 6);
  }

  static List roll2d20(){
    return rollDice(2, 20);
  }

  static List coinFlip(){
    return rollDice(1, 2);
  }

  static List roll1d3(){
    return rollDice(1, 3);
  }

  static List roll1d4(){
    return rollDice(1, 4);
  }

  static List roll1d6(){
    return rollDice(1, 6);
  }

  static List roll1d8(){
    return rollDice(1, 8);
  }

  static List roll1d10(){
    return rollDice(1, 10);
  }

  static List roll1d12(){
    return rollDice(1, 12);
  }

  static List roll1d20(){
    return rollDice(1, 20);
  }

  static List roll1d30(){
    return rollDice(1, 30);
  }

  static List roll1d100(){
    return rollDice(1, 100);
  }


}
