import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:generator5e/models/wildmagicitem.dart';
import 'package:generator5e/services/diceRoller.dart';
import 'package:generator5e/services/utility.dart';

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
    int roll = DiceRoller.roll1d100();

    return wildMagicItem.table[roll.toString()].toString();
  }
}
