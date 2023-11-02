import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:generator5e/models/spell.dart';
import 'package:generator5e/services/utility.dart';

class MagicItemGenerator5e {
  List _spellsFromData = [];
  List<Spell> spellsObjList = [];

  String randomizeScroll(String genericScroll) {
    List<String> scrollPieces = genericScroll.split(", ");
    readSpellsJson();
    String level = scrollPieces[1];
    spellsObjList = getSpellsObjectList();
    spellsObjList = getSpellsByLevel(level);
    Spell spell =
        spellsObjList[Utility.getRandomIndexFromListSize(spellsObjList.length)];
    return 'Scroll of ${spell.name}';
  }

  Future<void> readSpellsJson() async {
    final String response =
        await rootBundle.loadString('assets/jsondata/spells.json');
    final data = await json.decode(response);
    _spellsFromData = data["spells"] as List;
  }

  getSpellsObjectList() {
    spellsObjList =
        _spellsFromData.map((tJson) => Spell.fromJson(tJson)).toList();
  }

  List<Spell> getSpellsByLevel(String level) {
    return spellsObjList.where((sp) => sp.level == level).toList();
  }
}
