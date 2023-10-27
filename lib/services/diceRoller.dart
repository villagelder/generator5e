import 'dart:math';

class DiceRoller {
  static List rollDice(int number, int sides) {
    var diceList = [];
    for (int i = 0; i < number; i++) {
      diceList.add(rollDie(sides));
    }
    return diceList;
  }

  static int rollDie(int sides) {
    Random random = Random();
    int roll = random.nextInt(sides) + 1;
    return roll;
  }

  int rollNumberBetween(int min, int max) {
    Random random = Random();
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
}
