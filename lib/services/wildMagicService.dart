import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:generator5e/models/wildmagicitem.dart';
import 'package:generator5e/services/diceRoller.dart';

class WildMagicService {
  List _wildMagicItems = [];
  List<WildMagicItem> wildMagicObjList = [];

  WildMagicService() {
    init();
  }

  Future<void> init() async {
    await readJsonWildMagic();
    getWildMagicObjectList();
  }

  Future<void> readJsonWildMagic() async {
    final String response =
        await rootBundle.loadString('assets/jsondata/wildmagic.json');
    final data = await json.decode(response);
    _wildMagicItems = data["wildmagic"] as List;
  }

  getWildMagicObjectList() {
    wildMagicObjList =
        _wildMagicItems.map((wJson) => WildMagicItem.fromJson(wJson)).toList();
  }

  WildMagicItem getWildMagicItemByTitle(String title) {
    return wildMagicObjList.where((wmi) => wmi.title == title).toList()[0];
  }

  String getWildMagicSurgeByType(String type) {
    WildMagicItem wildMagicItem = getWildMagicItemByTitle(type);
    int roll = DiceRoller.getTotalRollFromDice(wildMagicItem.dice);

    return wildMagicItem.table[roll.toString()].toString();
  }

  List<String> getWildMagicSurgeListByType(String type, String number) {
    int num = int.parse(number);
    List<String> surgeList = [];
    for (int i = 0; i < num; i++) {
      String surge = getWildMagicSurgeByType(type);

      while (surgeList.contains(surge)) {
        surge = getWildMagicSurgeByType(type);
      }
      surgeList.add(surge);
    }

    return surgeList;
  }
}
