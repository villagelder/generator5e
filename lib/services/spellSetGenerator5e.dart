import 'dart:convert';
import 'dart:core';

import 'package:flutter/services.dart';
import 'package:generator5e/models/bonusspells.dart';
import 'package:generator5e/services/diceRoller.dart';
import 'package:generator5e/services/utility.dart';

import '../models/spell.dart';
import '../models/spellsknown.dart';

class SpellSetGenerator {
  List _spellsKnownItems = [];
  List<SpellsKnown> spellsKnownObjList = [];
  List _bonusSpellsItems = [];
  List<BonusSpells> bonusSpellsObjList = [];
  List _spellsItems = [];
  List<Spell> spellObjList = [];

  SpellSetGenerator() {
    init();
  }

  Future<void> init() async {
    await readJsonSpellsKnown();
    getSpellsKnownObjectList();
    await readJsonSpells();
    getSpellObjectList();
  }

  Future<void> readJsonSpells() async {
    final String response =
        await rootBundle.loadString('assets/jsondata/spell.json');
    final data = await json.decode(response);
    _spellsItems = data["spell"] as List;
  }

  Future<void> readJsonSpellsKnown() async {
    final String response =
        await rootBundle.loadString('assets/jsondata/spellsperlvl.json');
    final data = await json.decode(response);
    _spellsKnownItems = data["spellsKnown"] as List;
  }

  Future<void> readJsonBonusSpells() async {
    final String response =
    await rootBundle.loadString('assets/jsondata/spellsbonus.json');
    final data = await json.decode(response);
    _spellsKnownItems = data["spellsKnown"] as List;
  }

  getBonusSpellsObjectList() {
    bonusSpellsObjList =
        _bonusSpellsItems.map((bJson) => BonusSpells.fromJson(bJson)).toList();
  }

  getSpellsKnownObjectList() {
    spellsKnownObjList =
        _spellsKnownItems.map((tJson) => SpellsKnown.fromJson(tJson)).toList();
  }

  getSpellObjectList() {
    spellObjList =
        _spellsItems.map((spJson) => Spell.fromJson(spJson)).toList();
  }

  SpellsKnown getSpellsKnownObjClassAndLevel(String className, int level) {
    return spellsKnownObjList
        .where((sk) => sk.className == className && sk.level == level)
        .toList()[0];
  }

  BonusSpells getBonusSpellsByClassAndSubclass(String className, String subclass) {
    return bonusSpellsObjList.where((bs) => bs.classname == className && bs.subclass == subclass).toList()[0];
  }

  BonusSpells getBonusSpellsByClassAndSubclassAndChoice(String className, String subclass, String choice) {
    return bonusSpellsObjList.where((bs) => bs.classname == className && bs.subclass == subclass && bs.choice == choice).toList()[0];
  }

  List<Spell> getSpellsByClass(String className) {
    return spellObjList.where((sObj) => sObj.classes.contains(className))
        as List<Spell>;
  }

  List<Spell> getSpellsByClassAndLevel(String className, int lvl) {
    if (className == "Eldritch Knight") {
      className = "Wizard";
    }
    List<Spell> spList = spellObjList
        .where((sObj) =>
            sObj.classes.contains(className) && int.parse(sObj.level) == lvl)
        .toList();
    return spList;
  }

  List<Spell> getSpellsByClassAndLevelAndSchool(
      String className, int lvl, String school) {
    return spellObjList
        .where((sObj) =>
            sObj.classes.contains(className) &&
            int.parse(sObj.level) == lvl &&
            sObj.school == school)
        .toList();
  }

  Map<String, String> generateSpellSetMap(
      String className, String subclass, String classLevel) {
    int clLevel = 1;
    String subtitleLevel = classLevel;
    if (classLevel == "Any Level") {
      clLevel = DiceRoller.roll1d20();
      subtitleLevel = clLevel.toString();
    } else if (classLevel == "Legendary") {
      clLevel = 20;
    } else {
      clLevel = int.parse(classLevel);
    }
    String title = "$className ($subclass)";
    String subtitle = "Level $subtitleLevel Spell Set";
    if (classLevel == "Legendary") {
      subtitle = "$classLevel Spell Set";
    }
    SpellsKnown spellsKnownObj;

    if (subclass == "Eldritch Knight") {
      spellsKnownObj =
          getSpellsKnownObjClassAndLevel("Eldritch Knight", clLevel);
    } else if (subclass == "Arcane Trickster") {
      spellsKnownObj =
          getSpellsKnownObjClassAndLevel("Arcane Trickster", clLevel);
    } else {
      spellsKnownObj = getSpellsKnownObjClassAndLevel(className, clLevel);
    }

    if (classLevel == "Legendary") {
      if (subclass == "Eldritch Knight" ||
          className == "Paladin" ||
          className == "Ranger" ||
          className == "Warlock") {
        spellsKnownObj.cantrips += 2;
        spellsKnownObj.lvl1 += 3;
        spellsKnownObj.lvl2 += 2;
        spellsKnownObj.lvl3 += 1;
        spellsKnownObj.lvl4 += 1;
        spellsKnownObj.lvl5 += 1;
      } else if (subclass == "Arcane Trickster") {
        spellsKnownObj.cantrips += 1;
        spellsKnownObj.lvl1 += 2;
        spellsKnownObj.lvl2 += 1;
        spellsKnownObj.lvl3 += 1;
        spellsKnownObj.lvl4 += 1;
      } else {
        spellsKnownObj.cantrips += 2;
        spellsKnownObj.lvl1 += 3;
        spellsKnownObj.lvl2 += 2;
        spellsKnownObj.lvl3 += 1;
        spellsKnownObj.lvl4 += 1;
        spellsKnownObj.lvl5 += 1;
        spellsKnownObj.lvl6 += 1;
        spellsKnownObj.lvl7 += 1;
        spellsKnownObj.lvl8 += 1;
        spellsKnownObj.lvl9 += 1;
      }
    }

    Map<String, String> spellMap = {
      title: subtitle,
      "Cantrips": "",
      "Level 1": "",
      "Level 2": "",
      "Level 3": "",
      "Level 4": "",
      "Level 5": "",
      "Level 6": "",
      "Level 7": "",
      "Level 8": "",
      "Level 9": "",
    };

    if (className == "Wizard") {
      spellMap = getWizardSubclassSpells(
          spellsKnownObj, spellMap, className, subclass);
    } else if (subclass == "Eldritch Knight") {
      spellMap = getWizardSubclassSpells(
          spellsKnownObj, spellMap, "Wizard", "Evocation");
    } else if (subclass == "Arcane Trickster") {
      spellMap = getWizardSubclassSpells(
          spellsKnownObj, spellMap, "Wizard", "Illusion");
    }

    int numSpells = 0;

    //level loop
    for (int i = 0; i < 10; i++) {
      switch (i) {
        case 0:
          numSpells = spellsKnownObj.cantrips;
          break;
        case 1:
          numSpells = spellsKnownObj.lvl1;
          break;
        case 2:
          numSpells = spellsKnownObj.lvl2;
          break;
        case 3:
          numSpells = spellsKnownObj.lvl3;
          break;
        case 4:
          numSpells = spellsKnownObj.lvl4;
          break;
        case 5:
          numSpells = spellsKnownObj.lvl5;
          break;
        case 6:
          numSpells = spellsKnownObj.lvl6;
          break;
        case 7:
          numSpells = spellsKnownObj.lvl7;
          break;
        case 8:
          numSpells = spellsKnownObj.lvl8;
          break;
        case 9:
          numSpells = spellsKnownObj.lvl9;
          break;
      }

      //cantrips
      if (i == 0) {
        for (int c = 0; c < numSpells; c++) {
          String spell = getRandomSpellNameClassAndLevel(className, i);
          if (spellMap["Cantrips"] == "") {
            spellMap["Cantrips"] = spell;
            continue;
          }

          String? spells = spellMap["Cantrips"];
          while (spells!.contains(spell)) {
            spell = getRandomSpellNameClassAndLevel(className, i);
          }
          spellMap["Cantrips"] = "$spells, $spell";
        }
      } else {
        //spell level
        for (int d = 0; d < numSpells; d++) {
          String spell = getRandomSpellNameClassAndLevel(className, i);

          if (spellMap["Level $i"] == "") {
            spellMap["Level $i"] =
                getRandomSpellNameClassAndLevel(className, i);
            continue;
          }

          String? spells = spellMap["Level ${i.toString()}"];
          while (spells!.contains(spell)) {
            spell = getRandomSpellNameClassAndLevel(className, i);
          }
          spellMap["Level $i"] = "$spells, $spell";
        }
      }
    }

    //trim spellMap
    Map<String, String> mp = {};
    spellMap.forEach((key, value) {
      if (value.isNotEmpty) {
        mp[key] = value;
      }
    });

    return mp;
  }

  String getRandomSpellNameClassAndLevel(String className, int lvl) {
    if (className == "Fighter" || className == "Rogue") {
      className = "Wizard";
    }
    List<Spell> spellList = getSpellsByClassAndLevel(className, lvl);
    String spellName =
        spellList[Utility.getRandomIndexFromListSize(spellList.length)].name;
    return spellName;
  }

  Map<String, String> getWizardSubclassSpells(SpellsKnown spellsKnown,
      Map<String, String> spellMap, String className, String subclass) {
    List<Spell> spells = [];
    String school = "Abjuration";

    if (subclass == "Bladesinging") {
      school = "Conjuration";
    } else if (subclass == "Order of Scribes") {
      school = "Divination";
    } else if (subclass == "School of War") {
      school = "Evocation";
    } else if (subclass == "Eldritch Knight") {
      school = "Evocation";
    } else {
      school = subclass.replaceFirst("School of ", "");
    }

    String jsonSpellsKnown = jsonEncode(spellsKnown);
    Map<String, dynamic> jsonspk = jsonDecode(jsonSpellsKnown);
    for (String prop in jsonspk.keys) {
      if (prop == "cantrips" && jsonspk[prop] > 0) {
        spells = getSpellsByClassAndLevelAndSchool(className, 0, school);
        spellMap["Cantrips"] =
            spells[Utility.getRandomIndexFromListSize(spells.length)].name;
      }

      if (prop.toString().contains("lvl") && jsonspk[prop] > 0) {
        int lvl = int.parse(prop.toString().replaceFirst("lvl", ""));
        spells = getSpellsByClassAndLevelAndSchool(className, lvl, school);
        if (spells.isNotEmpty) {
          spellMap["Level $lvl"] =
              spells[Utility.getRandomIndexFromListSize(spells.length)].name;
        }
      }
    }
    return spellMap;
  }
}
