import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:generator5e/services/diceRoller.dart';
import 'package:collection/collection.dart';
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
    _spellsKnownItems = data["spells"] as List;
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

  SpellsKnown getSpellObjClassAndLevel(String className, int level) {
    return spellsKnownObjList.where(
            (sk) =>
        sk.className == className && sk.level == level) as SpellsKnown;
  }

  List<Spell> getSpellsByClass(String className) {
    return spellObjList.where((sObj) => sObj.classes.contains(className))
    as List<Spell>;
  }

  List<Spell> getSpellsByClassAndLevel(String className, int lvl) {
    return spellObjList.where((sObj) =>
    sObj.classes.contains(className) && int.parse(sObj.level) == lvl)
    as List<Spell>;
  }

  List<Spell> getSpellsByClassAndLevelAndSchool(String className, int lvl,
      String school) {
    return spellObjList.where((sObj) =>
    sObj.classes.contains(className) &&
        int.parse(sObj.level) == lvl &&
        sObj.school == school) as List<Spell>;
  }

  Map<String, String> generateSpellSetMap(String className, int classLevel) {
    SpellsKnown spellsKnownObj =
    getSpellObjClassAndLevel(className, classLevel);

    Map<String, String> spellMap = {
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

    int spellsKnown = 0;

    //level loop
    for (int i = 0; i < 10; i++) {
      switch (i) {
        case 0:
          spellsKnown = spellsKnownObj.cantrips;
          break;
        case 1:
          spellsKnown = spellsKnownObj.lvl1;
          break;
        case 2:
          spellsKnown = spellsKnownObj.lvl2;
          break;
        case 3:
          spellsKnown = spellsKnownObj.lvl3;
          break;
        case 4:
          spellsKnown = spellsKnownObj.lvl4;
          break;
        case 5:
          spellsKnown = spellsKnownObj.lvl5;
          break;
        case 6:
          spellsKnown = spellsKnownObj.lvl6;
          break;
        case 7:
          spellsKnown = spellsKnownObj.lvl7;
          break;
        case 8:
          spellsKnown = spellsKnownObj.lvl8;
          break;
        case 9:
          spellsKnown = spellsKnownObj.lvl9;
          break;
      }

      //cantrips
      if (i == 0) {
        for (int c = 0; c < spellsKnown; c++) {
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
        for (int d = 0; d < spellsKnown; d++) {
          String spell = getRandomSpellNameClassAndLevel(className, i);

          if (d == 0) {
            spellMap["lvl$i"] = getRandomSpellNameClassAndLevel(className, i);
            continue;
          }

          String? spells = spellMap["Level ${i.toString()}"];
          while (spells!.contains(spell)) {
            spell = getRandomSpellNameClassAndLevel(className, i);
          }
          spellMap["lvl$i"] = "${spells!}, $spell";
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
