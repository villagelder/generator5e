import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:generator5e/services/diceRoller.dart';

import '../models/treasures.dart';

class TreasureGenerator5e {
  Iterable _items = [];
  List<Treasures> trList = [];
  Treasures? trObj;

  static Treasures? getTreasures(TreasureGenerator5e tGen) {
    return tGen.trObj;
  }

  findTreasureBySelections(String cr, String type) {
    int roll = DiceRoller.roll1d100();
    int chRating = translateCR(cr);
    getTreasuresObjects();
    type = type.toLowerCase();
    for (var tr in trList) {
      if (tr.challengeRating == chRating &&
          tr.type == type &&
          tr.minroll >= roll &&
          tr.maxroll <= roll) {
        trObj = tr;
      }
    }
  }

  static int translateCR(String cr) {
    cr = cr.toLowerCase();
    switch (cr) {
      case 'cr 17+':
        return 17;
      case 'cr 5-10':
        return 10;
      case 'cr 11-16':
        return 16;
      default:
        return 4;
    }
  }

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/jsondata/treasuregen.json');
    final data = await json.decode(response);
    _items = data["treasures"] as List;
  }

  getTreasuresObjects() {
    readJson();
    trList = _items.map((tJson) => Treasures.fromJson(tJson)).toList();
  }
}
