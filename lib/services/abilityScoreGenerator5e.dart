import 'package:generator5e/services/diceRoller.dart';
import 'package:collection/collection.dart';

class AbilityScoreGenerator {
  List<String> generateDiceRolls(String methodValue) {
    Map<String, int> abilitiesMap = {
      "STR": 0,
      "DEX": 0,
      "CON": 0,
      "INT": 0,
      "WIS": 0,
      "CHA": 0,
    };

    List<String> rollsList = [];

    switch (methodValue) {
      case "Advantage 3d6":
        rollsList.add("Method: Advantage 3d6");
        abilitiesMap = rollAdvantage3d6();
        break;
      case "Open Classic 3d6":
        rollsList.add("Method: Open Classic 3d6");
        abilitiesMap = rollOpenClassic3d6();
        break;
      case "Open Classic 3d6 (x7)":
        rollsList.add("Method: Open Classic 3d6 (x7)");
        abilitiesMap = rollOpenClassic3d6x7();
        break;
      case "Open 3d6 (x12)":
        rollsList.add("Method: Open 3d6 (x12)");
        abilitiesMap = rollOpen3d6x12();
        break;
      case "4d6 Drop Lowest":
        rollsList.add("Method: 4d6 Drop Lowest");
        abilitiesMap = roll4d6DropLowest();
        break;
      case "Standard Array":
        rollsList.add("Method: Standard Array");
        abilitiesMap = getStandardArray();
        break;
      case "Extreme Array":
        rollsList.add("Method: Extreme Array");
        abilitiesMap = getExtremeArray();
        break;
      case "Hardcore Array":
        rollsList.add("Method: Hardcore Array");
        abilitiesMap = getHardcoreArray();
        break;
      case "Heroic Array":
        rollsList.add("Method: Heroic Array");
        abilitiesMap = getHeroicArray();
        break;
      case "Commoner Array":
        rollsList.add("Method: Commoner Array");
        abilitiesMap = getCommonerArray();
        break;
      default:
        rollsList.add("Method: Classic 3d6");
        abilitiesMap = rollClassic3d6();
        break;
    }

    var scores = StringBuffer();

    if (methodValue == "Advantage 3d6" || methodValue == "Classic 3d6") {
      for (var k in abilitiesMap.keys) {
        if (k == "CHA") {
          scores.write("$k: ${abilitiesMap[k]}");
          continue;
        }
        scores.write("$k: ${abilitiesMap[k]}, ");
      }
    } else if (methodValue == "Open 3d6 (x12)") {
      for (var k in abilitiesMap.keys) {
        if (int.parse(k) < 6) {
          scores.write("${abilitiesMap[k]}, ");
          continue;
        } else if (int.parse(k) == 6) {
          scores.write("${abilitiesMap[k]}\n");
        } else if (int.parse(k) > 6 && int.parse(k) < 12) {
          scores.write("${abilitiesMap[k]}, ");
        } else {
          scores.write("${abilitiesMap[k]}");
        }
      }
    } else if (methodValue == "Open Classic 3d6 (x7)") {
      for (var k in abilitiesMap.keys) {
        if (k == "CHA" || int.parse(k) == 7) {
          scores.write("${abilitiesMap[k]}");
          continue;
        }
        scores.write("${abilitiesMap[k]}, ");
      }
  }else {
      for (var k in abilitiesMap.keys) {
        if (k == "CHA" || int.parse(k) == 6) {
          scores.write("${abilitiesMap[k]}");
          continue;
        }
        scores.write("${abilitiesMap[k]}, ");
      }
    }

    rollsList.add(scores.toString());

    return rollsList;
  }

  Map<String, int> rollClassic3d6() {
    Map<String, int> abilitiesMap = {
      "STR": 0,
      "DEX": 0,
      "CON": 0,
      "INT": 0,
      "WIS": 0,
      "CHA": 0,
    };

    for (var k in abilitiesMap.keys) {
      List<int> rolls = DiceRoller.roll3d6() as List<int>;
      int total = rolls.sum;
      abilitiesMap[k] = total;
    }

    return abilitiesMap;
  }

  Map<String, int> rollAdvantage3d6() {
    Map<String, int> abilitiesMap = {
      "STR": 0,
      "DEX": 0,
      "CON": 0,
      "INT": 0,
      "WIS": 0,
      "CHA": 0,
    };

    for (var k in abilitiesMap.keys) {
      List<int> rolls1 = DiceRoller.roll3d6() as List<int>;
      List<int> rolls2 = DiceRoller.roll3d6() as List<int>;
      int total1 = rolls1.sum;
      int total2 = rolls2.sum;

      if (total2 >= total1) {
        abilitiesMap[k] = total2;
      } else {
        abilitiesMap[k] = total1;
      }
    }

    return abilitiesMap;
  }

  Map<String, int> rollOpenClassic3d6() {
    Map<String, int> abilitiesMap = {
      "1": 0,
      "2": 0,
      "3": 0,
      "4": 0,
      "5": 0,
      "6": 0,
    };

    for (var k in abilitiesMap.keys) {
      List<int> rolls = DiceRoller.roll3d6() as List<int>;
      int total = rolls.sum;
      abilitiesMap[k] = total;
    }

    return abilitiesMap;
  }

  Map<String, int> rollOpenClassic3d6x7() {
    Map<String, int> abilitiesMap = {
      "1": 0,
      "2": 0,
      "3": 0,
      "4": 0,
      "5": 0,
      "6": 0,
      "7": 0
    };

    for (var k in abilitiesMap.keys) {
      List<int> rolls = DiceRoller.roll3d6() as List<int>;
      int total = rolls.sum;
      abilitiesMap[k] = total;
    }

    return abilitiesMap;
  }

  Map<String, int> rollOpen3d6x12() {
    Map<String, int> abilitiesMap = {
      "1": 0,
      "2": 0,
      "3": 0,
      "4": 0,
      "5": 0,
      "6": 0,
      "7": 0,
      "8": 0,
      "9": 0,
      "10": 0,
      "11": 0,
      "12": 0
    };

    for (var k in abilitiesMap.keys) {
      List<int> rolls = DiceRoller.roll3d6() as List<int>;
      int total = rolls.sum;
      abilitiesMap[k] = total;
    }

    return abilitiesMap;
  }

  Map<String, int> roll4d6DropLowest() {
    Map<String, int> abilitiesMap = {
      "1": 0,
      "2": 0,
      "3": 0,
      "4": 0,
      "5": 0,
      "6": 0,
    };

    for (var k in abilitiesMap.keys) {
      int roll = DiceRoller.rollDiceDropLowest(4, 6);
      abilitiesMap[k] = roll;
    }

    return abilitiesMap;
  }

  Map<String, int> getStandardArray() {
    Map<String, int> abilitiesMap = {
      "1": 8,
      "2": 10,
      "3": 12,
      "4": 13,
      "5": 14,
      "6": 15,
    };

    return abilitiesMap;
  }

  Map<String, int> getHardcoreArray() {
    Map<String, int> abilitiesMap = {
      "1": 6,
      "2": 7,
      "3": 9,
      "4": 11,
      "5": 13,
      "6": 14,
    };

    return abilitiesMap;
  }

  Map<String, int> getHeroicArray() {
    Map<String, int> abilitiesMap = {
      "1": 9,
      "2": 11,
      "3": 12,
      "4": 15,
      "5": 16,
      "6": 17,
    };



    return abilitiesMap;
  }

  Map<String, int> getCommonerArray() {
    Map<String, int> abilitiesMap = {
      "1": 8,
      "2": 9,
      "3": 10,
      "4": 10,
      "5": 10,
      "6": 11,
    };



    return abilitiesMap;
  }

  Map<String, int> getExtremeArray() {
    Map<String, int> abilitiesMap = {
      "1": 3,
      "2": 6,
      "3": 7,
      "4": 15,
      "5": 16,
      "6": 18,
    };

    return abilitiesMap;
  }
}
