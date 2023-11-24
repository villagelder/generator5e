import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/bonusspells.dart';

class BonusSpellsService {
  List _bonusSpellsItems = [];
  List<BonusSpells> bonusSpellsObjList = [];

  Future<void> init() async {
    await readJsonBonusSpells();
    getBonusSpellsObjectList();
  }

  Future<void> readJsonBonusSpells() async {
    final String response =
        await rootBundle.loadString('assets/jsondata/spellsbonus.json');
    final data = await json.decode(response);
    _bonusSpellsItems = data["spellsKnown"] as List;
  }

  getBonusSpellsObjectList() {
    bonusSpellsObjList =
        _bonusSpellsItems.map((bJson) => BonusSpells.fromJson(bJson)).toList();
  }

  BonusSpells getBonusSpellsByClassAndSubclass(
      String className, String subclass) {
    return bonusSpellsObjList
        .where((bs) => bs.classname == className && bs.subclass == subclass)
        .toList()[0];
  }

  BonusSpells getBonusSpellsByClassAndSubclassAndChoice(
      String className, String subclass, String choice) {
    return bonusSpellsObjList
        .where((bs) =>
            bs.classname == className &&
            bs.subclass == subclass &&
            bs.choice == choice)
        .toList()[0];
  }
}
