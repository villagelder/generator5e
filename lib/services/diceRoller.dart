import 'dart:math';
import 'package:collection/collection.dart';

class DiceRoller {
  static List<String> parseDiceText(String dicetext) {
    List<String> pd = [];

    if (dicetext != "0") {
      dicetext = dicetext.toLowerCase();
      pd = dicetext.split("d");
    }

    return pd;
  }

  static List<int> rollDice(int number, int sides) {
    List<int> diceList = [];
    for (int i = 0; i < number; i++) {
      diceList.add(rollDie(sides));
    }
    return diceList;
  }

  static int rollDiceAndSum(int n, int sides) {
    List<int> dice = rollDice(n, sides);
    return dice.sum;
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

  static List roll4d6() {
    return rollDice(4, 6);
  }

  static List roll3d6() {
    return rollDice(3, 6);
  }

  static List roll2d6() {
    return rollDice(2, 6);
  }

  static List roll2d20() {
    return rollDice(2, 20);
  }

  static int coinFlip() {
    return rollDie(2);
  }

  static int roll1d3() {
    return rollDie(3);
  }

  static int roll1d4() {
    return rollDie(4);
  }

  static int roll1d6() {
    return rollDie(6);
  }

  static int roll1d8() {
    return rollDie(8);
  }

  static int roll1d10() {
    return rollDie(10);
  }

  static int roll1d12() {
    return rollDie(12);
  }

  static int roll1d20() {
    return rollDie(20);
  }

  static int roll1d30() {
    return rollDie(30);
  }

  static int roll1d100() {
    return rollDie(100);
  }
}
