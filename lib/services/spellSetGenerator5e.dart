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
        (sk) => sk.className == className && sk.level == level) as SpellsKnown;
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

  List<Spell> getSpellsByClassAndLevelAndSchool(
      String className, int lvl, String school) {
    return spellObjList.where((sObj) =>
        sObj.classes.contains(className) &&
        int.parse(sObj.level) == lvl &&
        sObj.school == school) as List<Spell>;
  }

  Map<String, String> generateSpellSet(
      String className, int lvl, String school) {
    SpellsKnown spellsKnownObj = getSpellObjClassAndLevel(className, lvl);

    Map<String, String> spellMap = {
      "Spells Known": "",
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

    int count = 0;

    //level loop
    for (int i = 0; i < 10; i++) {
      //cantrips
      if (i == 0) {
        for (int c = 0; c < spellsKnownObj.cantrips; c++) {
          if (c == 0) {
            spellMap["Cantrips"] =
                getRandomSpellNameClassAndLevel(className, lvl);
          }

          String? spells = spellMap["Cantrips"];
          spellMap["Cantrips"] =
              "${spells!}, ${getRandomSpellNameClassAndLevel(className, lvl)}";
        }
      }

      //each level
    }

    return spellMap;
  }

  String getRandomSpellNameClassAndLevel(String className, int lvl) {
    List<Spell> spellList = getSpellsByClassAndLevel(className, lvl);
    String spellName =
        spellList[Utility.getRandomIndexFromListSize(spellList.length)].name;
    return spellName;
  }
}
