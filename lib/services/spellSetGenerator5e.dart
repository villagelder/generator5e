import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:generator5e/services/diceRoller.dart';
import 'package:collection/collection.dart';

import '../models/spellsknown.dart';

class SpellSetGenerator {
  List _spellsKnownItems = [];
  List<SpellsKnown> spellsKnownObjList = [];
  bool _isLoaded = false;

  PersonalityGenerator() {
    init();
  }

  Future<void> init() async {
    await readJsonSpellsKnown();
    getSpellsKnownObjectList();
  }

  Future<void> readJsonSpellsKnown() async {
    final String response =
        await rootBundle.loadString('assets/jsondata/spellsperlvl.json');
    final data = await json.decode(response);
    _spellsKnownItems = data["personalities"] as List;
  }

  getSpellsKnownObjectList() {
    spellsKnownObjList =
        _spellsKnownItems.map((tJson) => SpellsKnown.fromJson(tJson)).toList();
  }

  SpellsKnown getSpellMapByClassAndLevel(String className, int level) {
    return spellsKnownObjList.where(
        (sk) => sk.className == className && sk.level == level) as SpellsKnown;
  }
}
