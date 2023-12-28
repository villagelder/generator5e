import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:generator5e/models/equipment.dart';
import 'package:generator5e/models/magicitem.dart';
import 'package:generator5e/services/utility.dart';

import '../models/spell.dart';

class MagicItemGenerator5e {
  List _equipmentList = [];
  List<Equipment> equipmentObjList = [];

  MagicItemGenerator5e() {
    init();
  }

  Future<void> init() async {
    await readJsonEquipment();
    getEquipmentObjectList();
  }

  Future<void> readJsonEquipment() async {
    final String response =
        await rootBundle.loadString('assets/jsondata/equipment.json');
    final data = await json.decode(response);
    _equipmentList = data["equipment"] as List;
  }

  getEquipmentObjectList() {
    equipmentObjList =
        _equipmentList.map((mJson) => Equipment.fromJson(mJson)).toList();
  }

  List<Equipment> getAllEquipment(){
    return equipmentObjList;
  }

  List<Equipment> getEquipmentByCategory(String category){
    return equipmentObjList.where((eq) => eq.category == category).toList();
  }

  List<Equipment> getEquipmentBySubtype(String subtype){
    return equipmentObjList.where((eq) => eq.subtypes!.contains(subtype)).toList();
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

    if (type == "scroll") {
      if (rarity == "artifact") {
        magicItemsList.add("no items found for this value");
        return magicItemsList;
      }
      return getScrollsArray(magicItems, number);
    } else {
      int itemCount = int.parse(number);
      if (magicItems.length < itemCount) {
        itemCount = magicItems.length;
      }

      if (magicItems.isNotEmpty) {
        for (int i = 0; i < itemCount; i++) {
          int ix = Utility.getRandomIndexFromListSize(magicItems.length);
          String magicItem = "${magicItems[ix].name} (${magicItems[ix].source})";
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
      } else {
        magicItemsList.add("no items found for this value");
      }
    }

    return magicItemsList;
  }

  List<String> getScrollsArray(List<MagicItem> magicItems, String number) {
    int n = int.parse(number);
    List<String> scrolls = [];

    for (int i = 0; i < n; i++) {
      String genScroll =
          magicItems[Utility.getRandomIndexFromListSize(magicItems.length)]
              .name;
      String spellScroll = randomizeScroll(genScroll);
      while (scrolls.contains(spellScroll)) {
        spellScroll = randomizeScroll(genScroll);
      }
      scrolls.add(spellScroll);
    }
    return scrolls;
  }
}
