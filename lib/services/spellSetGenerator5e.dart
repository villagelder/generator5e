import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:generator5e/services/diceRoller.dart';
import 'package:generator5e/services/utility.dart';

import '../models/spell.dart';
import '../models/spellsknown.dart';

class SpellSetGenerator {
  List _spellsKnownItems = [];
  List<SpellsKnown> spellsKnownObjList = [];
  List _spellsItems = [];
  List<Spell> spellObjList = [];
  bool _isLoaded = false;

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

  List<Spell> getSpellsByClass(String className) {
    return spellObjList.where((sObj) => sObj.classes.contains(className))
        as List<Spell>;
  }

  List<Spell> getSpellsByClassAndLevel(String className, int lvl) {
    List<Spell> spList = spellObjList
        .where((sObj) =>
            sObj.classes.contains(className) && int.parse(sObj.level) == lvl)
        .toList();
    return spList;
  }

  List<Spell> getSpellsByClassAndLevelAndSchool(
      String className, int lvl, String school) {
    return spellObjList.where((sObj) =>
        sObj.classes.contains(className) &&
        int.parse(sObj.level) == lvl &&
        sObj.school == school) as List<Spell>;
  }

  Map<String, String> generateSpellSetMap(String className, String classLevel) {
    int clLevel = 1;
    if (classLevel == "Any Level") {
      clLevel = DiceRoller.roll1d20();
    } else if (classLevel == "Legendary") {
      clLevel = 20;
    } else {
      clLevel = int.parse(classLevel);
    }
    String spellSet = "Level $classLevel Spell Set";
    if (className == "Wizard" || className == "Eld Knight") {
      spellSet = "Level $classLevel Spellbook";
      if (className == "Eld Knight") {
        className = "Eldritch Knight";
      }
    }
    SpellsKnown spellsKnownObj =
        getSpellsKnownObjClassAndLevel(className, clLevel);

    Map<String, String> spellMap = {
      "$className": spellSet,
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
          if (c == 0) {
            spellMap["Cantrips"] = spell;
            continue;
          }

          String? spells = spellMap["Cantrips"];
          while (spells!.contains(spell)) {
            spell = getRandomSpellNameClassAndLevel(className, i);
          }
          spellMap["Cantrips"] = "${spells!}, $spell";
        }
      } else {
        //spell level
        for (int d = 0; d < numSpells; d++) {
          String spell = getRandomSpellNameClassAndLevel(className, i);

          if (d == 0) {
            spellMap["Level $i"] =
                getRandomSpellNameClassAndLevel(className, i);
            continue;
          }

          String? spells = spellMap["Level ${i.toString()}"];
          while (spells!.contains(spell)) {
            spell = getRandomSpellNameClassAndLevel(className, i);
          }
          spellMap["Level $i"] = "${spells!}, $spell";
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
    List<Spell> spellList = getSpellsByClassAndLevel(className, lvl);
    String spellName =
        spellList[Utility.getRandomIndexFromListSize(spellList.length)].name;
    return spellName;
  }
}