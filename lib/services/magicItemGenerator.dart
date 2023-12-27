import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:generator5e/models/magicitem.dart';
import 'package:generator5e/services/utility.dart';

import '../models/spell.dart';

class MagicItemGenerator5e {
  List _magicitems = [];
  List<MagicItem> magicItemObjList = [];
  List _spellsJson = [];
  List<Spell> spellsObjList = [];
  bool _isLoaded = false;

  MagicItemGenerator5e() {
    init();
  }

  Future<void> init() async {
    await readJsonMagicItems();
    getMagicItemsObjectList();
    await readSpellsJson();
    getSpellsObjectList();
  }

  Future<void> initMagicItems() async {
    await readJsonMagicItems();
    getMagicItemsObjectList();
  }

  Future<void> initSpells() async {
    await readSpellsJson();
    getSpellsObjectList();
  }

  Future<void> readJsonMagicItems() async {
    final String response =
        await rootBundle.loadString('assets/jsondata/magicitems.json');
    final data = await json.decode(response);
    _magicitems = data["magicitems"] as List;
  }

  getMagicItemsObjectList() {
    magicItemObjList =
        _magicitems.map((mJson) => MagicItem.fromJson(mJson)).toList();
  }

  List<MagicItem> getAllMagicItems() {
    return magicItemObjList.where((mi) => mi.id < 999).toList();
  }

  List<MagicItem> getMagicItemsByRarity(String rarity) {
    return magicItemObjList.where((g) => g.rarity == rarity).toList();
  }

  List<MagicItem> getMagicItemsByRarityAndType(String rarity, String type) {
    if (rarity == "any rarity" && type == "all items") {
      return getAllMagicItems();
    }

    if (rarity == "any rarity" && type != "all items") {
      return magicItemObjList.where((g) => g.type == type).toList();
    }

    if (rarity != "any rarity" && type == "all items") {
      return magicItemObjList.where((g) => g.rarity == rarity).toList();
    }
    return magicItemObjList
        .where((g) => g.rarity == rarity && g.type == type)
        .toList();
  }

  getSpellsObjectList() {
    spellsObjList = _spellsJson.map((sJson) => Spell.fromJson(sJson)).toList();
  }

  List<Spell> getSpellsByLevel(String level) {
    return spellsObjList.where((sp) => sp.level == level).toList();
  }

  Future<void> readSpellsJson() async {
    final String response =
        await rootBundle.loadString('assets/jsondata/spell.json');
    final spdata = await json.decode(response);
    _spellsJson = spdata["spell"] as List;
  }

  String randomizeScroll(String genericScroll) {
    List<String> scrollPieces = genericScroll.split(", ");
    String level = scrollPieces[1];
    List<Spell> levelSpells = getSpellsByLevel(level);

    if (levelSpells.isNotEmpty) {
      Spell spell =
          levelSpells[Utility.getRandomIndexFromListSize(levelSpells.length)];
      return 'Scroll of ${spell.name}';
    }

    return genericScroll;
  }

  List<String> generateMagicItemsArray(
      String rarity, String type, String number) {
    rarity = rarity.toLowerCase();
    type = type.toLowerCase();
    List<String> magicItemsList = [];

    List<MagicItem> magicItems = getMagicItemsByRarityAndType(rarity, type);

    int itemCount = int.parse(number);
    if (magicItems.length < itemCount) {
      itemCount = magicItems.length;
    }

    if (magicItems.isNotEmpty) {
      for (int i = 0; i < itemCount; i++) {
        int ix = Utility.getRandomIndexFromListSize(magicItems.length);
        String magicItem = magicItems[ix].name;
        if (magicItem.contains("spell scroll")) {
          magicItem = randomizeScroll(magicItem);
        }

        if (!magicItemsList.contains(magicItem)) {
          magicItemsList.add(magicItem);
        } else {
          i--;
          continue;
        }
      }
    }else {
      magicItemsList.add("no items found for this value");
    }

    return magicItemsList;
  }
}
