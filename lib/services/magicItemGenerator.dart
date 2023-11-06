import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:generator5e/models/magicitem.dart';
import 'package:generator5e/services/utility.dart';

class MagicItemGenerator5e {
  List _magicitems = [];
  List<MagicItem> magicItemObjList = [];

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
        if (!magicItemsList.contains(magicItemObjList[ix].name)) {
          magicItemsList.add(magicItemObjList[ix].name);
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
}
