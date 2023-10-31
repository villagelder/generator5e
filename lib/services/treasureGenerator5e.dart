import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:generator5e/services/diceRoller.dart';

import '../models/treasures.dart';

class TreasureGenerator5e {
  List _items = [];
  List<Treasures> trObjList = [];
  int roll = 0;

   Treasures? findTreasureBySelections(String cr, String type) {
    roll = DiceRoller.roll1d100();
    int chRating = translateCR(cr);
    readJsonTreasureTable();
    getTreasuresObjectList();
    type = type.toLowerCase();
    for (Treasures tr in trObjList) {
      if (tr.challengeRating == chRating &&
          tr.type == type &&
          roll >= tr.minroll &&
          roll <= tr.maxroll
      ) {
        return tr;
      }
    }
       return null;
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

  Future<void> readJsonTreasureTable() async {
    final String response =
        await rootBundle.loadString('assets/jsondata/treasuregen.json');
    final data = await json.decode(response);
    _items = data["treasures"] as List;
  }

  getTreasuresObjectList() {
    trObjList = _items.map((tJson) => Treasures.fromJson(tJson)).toList();
  }

  List<String> generate(String cr, String type) {
    List<String> tl = [];
    Treasures? trObj = findTreasureBySelections(cr, type);
    if (trObj != null){
      return calculateCoins(trObj);
    }

    return tl;


    //get coins

    //get gems

    //get art

    //get magic items


  }

  List<String> calculateCoins(Treasures trObj){
    List<String> coinList = [];
    List<String> diceText = [];
    int sum;
    String coin;

    print(trObj?.copper);
    //copper
    diceText = DiceRoller.parseDiceText(trObj.copper);
    if (diceText.isNotEmpty) {
      sum = DiceRoller.rollDiceAndSum(int.parse(diceText[0]), int.parse(diceText[1])) * trObj.cpmultiplier;
      coin = '$sum cp';
      coinList.add(coin);
    }

    //silver
    diceText = DiceRoller.parseDiceText(trObj.silver);
    if (diceText.isNotEmpty) {
      sum = DiceRoller.rollDiceAndSum(int.parse(diceText[0]), int.parse(diceText[1])) * trObj.spmultiplier;
      coin = '$sum sp';
      coinList.add(coin);
    }

    //electrum
    diceText = DiceRoller.parseDiceText(trObj.electrum);
    if (diceText.isNotEmpty) {
      sum = DiceRoller.rollDiceAndSum(int.parse(diceText[0]), int.parse(diceText[1])) * trObj.epmultiplier;;
      coin = '$sum ep';
      coinList.add(coin);
    }

    //gold
    diceText = DiceRoller.parseDiceText(trObj.gold);
    if (diceText.isNotEmpty) {
      sum = DiceRoller.rollDiceAndSum(int.parse(diceText[0]), int.parse(diceText[1])) * trObj.gpmultiplier;
      coin = '$sum gp';
      coinList.add(coin);
    }

    //platinum
    diceText = DiceRoller.parseDiceText(trObj.platinum);
    if (diceText.isNotEmpty) {
      sum = DiceRoller.rollDiceAndSum(int.parse(diceText[0]), int.parse(diceText[1])) * trObj.ppmultiplier;;
      coin = '$sum pp';
      coinList.add(coin);
    }

    return coinList;
  }
}
