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
    readJsonMagicItems().then((_) {
      _isLoaded = true;
      getMagicItemsObjectList();
    });

  }

  sync() {
    while (!_isLoaded) {
      Future.delayed(const Duration(milliseconds: 100));
    }
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

  String generateRandomMagicItems(String rarity, String type, int n) {
    rarity = rarity.toLowerCase();
    type = type.toLowerCase();
    List<String> magicItemsList = [];
    readJsonMagicItems();
    getMagicItemsObjectList();

    magicItemObjList = getMagicItemsByRarityAndType(rarity, type);

    int itemCount = n;
    if (magicItemObjList.length < itemCount) {
      itemCount = magicItemObjList.length;
    }

    if (magicItemObjList.isNotEmpty) {
      for (int i = 0; i < itemCount; i++) {
        int ix = Utility.getRandomIndexFromListSize(magicItemObjList.length);
        String magicItem = magicItemObjList[ix].name;
        if (!magicItemsList.contains(magicItem)) {
          if (magicItem.contains("Spell Scroll")) {
            magicItem = randomizeScroll(magicItem);
          }
          magicItemsList.add(magicItem);
        } else {
          i--;
          continue;
        }
      }
    }

    if (magicItemsList.isEmpty) {
      return "No magic items were found.";
    }
    var items = StringBuffer();
    for (int i = 0; i < magicItemsList.length; i++) {
      if (i != magicItemsList.length - 1) {
        items.write('• ${magicItemsList[i]}\n');
      } else {
        items.write('• ${magicItemsList[i]}');
      }
    }

    return items.toString();
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
    readSpellsJson();
    getSpellsObjectList();
    String level = scrollPieces[1];
    spellsObjList = getSpellsByLevel(level);

    if (spellsObjList.isNotEmpty) {
      Spell spell = spellsObjList[
          Utility.getRandomIndexFromListSize(spellsObjList.length)];
      return 'Scroll of ${spell.name}';
    }

    return genericScroll;
  }

  List<String> generateMagicItemsArray(String rarity, String type, String number) {
    rarity = rarity.toLowerCase();
    type = type.toLowerCase();
    List<String> magicItemsList = [];
    sync();

    magicItemObjList = getMagicItemsByRarityAndType(rarity, type);

    int itemCount = int.parse(number);
    if (magicItemObjList.length < itemCount) {
      itemCount = magicItemObjList.length;
    }

    if (magicItemObjList.isNotEmpty) {
      for (int i = 0; i < itemCount; i++) {
        int ix = Utility.getRandomIndexFromListSize(magicItemObjList.length);
        String magicItem = magicItemObjList[ix].name;
        if (!magicItemsList.contains(magicItem)) {
          if (magicItem.contains("Spell Scroll")) {
            magicItem = randomizeScroll(magicItem);
          }
          magicItemsList.add(magicItem);
        } else {
          i--;
          continue;
        }
      }
    }

    return magicItemsList;

  }
}
