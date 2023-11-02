import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:generator5e/models/gemitem.dart';
import 'package:generator5e/services/diceRoller.dart';
import 'package:generator5e/services/magicItemGenerator.dart';
import 'package:generator5e/services/utility.dart';

import '../models/artitem.dart';
import '../models/magicitems.dart';
import '../models/treasures.dart';

class TreasureGenerator5e {
  List _treasureitems = [];
  List _magicitems = [];
  List _gemItems = [];
  List _artItems = [];
  List<GemItem> gemObjList = [];
  List<Treasures> trObjList = [];
  List<ArtItem> artObjList = [];
  List<MagicItem> magicItemObjList = [];
  int roll = 0;
  MagicItemGenerator5e mig5 = MagicItemGenerator5e();

  Treasures? rollTreasureBySelections(String cr, String type) {
    roll = DiceRoller.roll1d100();
    int chRating = translateCR(cr);
    int legendaryFactor = DiceRoller.rollDie(4) + 1;

    if (type == 'Legendary') {
      type = 'Hoard';
    }
    readJsonTreasureTable();
    getTreasuresObjectList();

    type = type.toLowerCase();
    for (Treasures tr in trObjList) {
      if (tr.challengeRating == chRating &&
          tr.type == type &&
          roll >= tr.minroll &&
          roll <= tr.maxroll) {
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
    _treasureitems = data["treasures"] as List;
  }

  Future<void> readJsonMagicItemsTable() async {
    final String response =
        await rootBundle.loadString('assets/jsondata/magicitems.json');
    final data = await json.decode(response);
    _magicitems = data["magicitems"] as List;
  }

  Future<void> readJsonGemItemsTable() async {
    final String response =
        await rootBundle.loadString('assets/jsondata/gemitems.json');
    final data = await json.decode(response);
    _gemItems = data["gemitems"] as List;
  }

  Future<void> readJsonArtItemsTable() async {
    final String response =
        await rootBundle.loadString('assets/jsondata/artitems.json');
    final data = await json.decode(response);
    _artItems = data["artitems"] as List;
  }

  getArtItemsObjectList() {
    artObjList = _artItems.map((artJson) => ArtItem.fromJson(artJson)).toList();
  }

  getGemItemsObjectList() {
    gemObjList = _gemItems.map((gJson) => GemItem.fromJson(gJson)).toList();
  }

  getTreasuresObjectList() {
    trObjList =
        _treasureitems.map((tJson) => Treasures.fromJson(tJson)).toList();
  }

  getMagicItemObjectList() {
    magicItemObjList =
        _magicitems.map((mJson) => MagicItem.fromJson(mJson)).toList();
  }

  String generate(String cr, String type) {
    bool isLegendary = false;
    List<String> tl = [];

    if (type == 'Legendary') {
      isLegendary = true;
      type = 'hoard';
    }

    Treasures? trObj = rollTreasureBySelections(cr, type);
    Treasures? trObj2 = rollTreasureBySelections(cr, type);

    if (trObj != null) {
      //get coins
      tl.addAll(calculateCoins(trObj, trObj2!, isLegendary));
      //get gems
      tl.addAll(calculateGems(trObj, trObj2!, isLegendary));
      //get art
      tl.addAll(calculateArt(trObj, trObj2!, isLegendary));
      //get magic items
      tl.addAll(calculateMagicItems(trObj, trObj2!, isLegendary));
    }

    if (tl.isEmpty) {
      return 'No Treasure';
    }

    var trl = StringBuffer();
    for (int i = 0; i < tl.length; i++) {
      if (i != tl.length - 1) {
        trl.write('${tl[i]}, ');
      } else {
        trl.write(tl[i]);
      }
    }

    return trl.toString();
  }

  List<String> calculateCoins(
      Treasures trObj, Treasures trObj2, bool isLegendary) {
    List<String> coinList = [];
    List<String> diceText = [];
    List<String> diceText2 = [];
    int sum = 0;
    String coin;

    //copper
    diceText = DiceRoller.parseDiceText(trObj.copper);
    if (diceText.isNotEmpty) {
      sum = DiceRoller.rollDiceAndSum(
              int.parse(diceText[0]), int.parse(diceText[1])) *
          trObj.cpmultiplier;

      if (isLegendary) {
        diceText2 = DiceRoller.parseDiceText(trObj2.copper);
        sum = sum +
            DiceRoller.rollDiceAndSum(
                    int.parse(diceText2[0]), int.parse(diceText2[1])) *
                trObj2.cpmultiplier;
      }

      coin = '$sum cp';
      coinList.add(coin);
    }

    //silver
    diceText = DiceRoller.parseDiceText(trObj.silver);
    if (diceText.isNotEmpty) {
      sum = DiceRoller.rollDiceAndSum(
              int.parse(diceText[0]), int.parse(diceText[1])) *
          trObj.spmultiplier;

      if (isLegendary) {
        diceText2 = DiceRoller.parseDiceText(trObj2.silver);
        sum = sum +
            DiceRoller.rollDiceAndSum(
                    int.parse(diceText2[0]), int.parse(diceText2[1])) *
                trObj2.spmultiplier;
      }

      coin = '$sum sp';
      coinList.add(coin);
    }

    //electrum
    diceText = DiceRoller.parseDiceText(trObj.electrum);
    if (diceText.isNotEmpty) {
      sum = DiceRoller.rollDiceAndSum(
              int.parse(diceText[0]), int.parse(diceText[1])) *
          trObj.epmultiplier;

      if (isLegendary) {
        diceText2 = DiceRoller.parseDiceText(trObj2.electrum);
        sum = sum +
            DiceRoller.rollDiceAndSum(
                    int.parse(diceText2[0]), int.parse(diceText2[1])) *
                trObj2.epmultiplier;
      }

      coin = '$sum ep';
      coinList.add(coin);
    }

    //gold
    diceText = DiceRoller.parseDiceText(trObj.gold);
    if (diceText.isNotEmpty) {
      sum = DiceRoller.rollDiceAndSum(
              int.parse(diceText[0]), int.parse(diceText[1])) *
          trObj.gpmultiplier;

      if (isLegendary) {
        diceText2 = DiceRoller.parseDiceText(trObj2.gold);
        sum = sum +
            DiceRoller.rollDiceAndSum(
                    int.parse(diceText2[0]), int.parse(diceText2[1])) *
                trObj2.gpmultiplier;
      }

      coin = '$sum gp';
      coinList.add(coin);
    }

    //platinum
    diceText = DiceRoller.parseDiceText(trObj.platinum);
    if (diceText.isNotEmpty) {
      sum = DiceRoller.rollDiceAndSum(
              int.parse(diceText[0]), int.parse(diceText[1])) *
          trObj.ppmultiplier;

      if (isLegendary) {
        diceText2 = DiceRoller.parseDiceText(trObj2.platinum);
        sum = sum +
            DiceRoller.rollDiceAndSum(
                    int.parse(diceText2[0]), int.parse(diceText2[1])) *
                trObj2.ppmultiplier;
      }

      coin = '$sum pp';
      coinList.add(coin);
    }

    return coinList;
  }

  List<GemItem> getGemsByValue(String value) {
    return gemObjList.where((g) => g.value == value).toList();
  }

  List<String> calculateGems(
      Treasures trObj, Treasures trObj2, bool isLegendary) {
    List<String> gemsList = [];
    readJsonGemItemsTable();
    getGemItemsObjectList();
    if (trObj.gems == "0") {
      return gemsList;
    }
    Map<String, int> gemMap = {};

    List<GemItem> gemsByValueList = getGemsByValue(trObj.gemsvalue.toString());
    List<String> parsedDice = DiceRoller.parseDiceText(trObj.gems);

    int numberOfGems = DiceRoller.rollDiceAndSum(
        int.parse(parsedDice[0]), int.parse(parsedDice[1]));

    for (int i = 0; i < numberOfGems; i++) {
      String gem = gemsByValueList[
              Utility.getRandomIndexFromListSize(gemsByValueList.length)]
          .stone;
      gemMap.update(gem, (value) => ++value, ifAbsent: () => 1);
    }

    if (isLegendary && trObj2.gems != "0") {
      List<GemItem> gemsByValueList =
          getGemsByValue(trObj2.gemsvalue.toString());
      List<String> parsedDice = DiceRoller.parseDiceText(trObj2.gems);

      int numberOfGems = DiceRoller.rollDiceAndSum(
          int.parse(parsedDice[0]), int.parse(parsedDice[1]));

      for (int i = 0; i < numberOfGems; i++) {
        String gem = gemsByValueList[
                Utility.getRandomIndexFromListSize(gemsByValueList.length)]
            .stone;
        gemMap.update(gem, (value) => ++value, ifAbsent: () => 1);
      }
    }

    gemMap.forEach((key, value) {
      String k = key.toLowerCase();
      String v = value.toString();
      String worth = "${trObj.gemsvalue.toString()} gp";
      String str = '$k ($worth)';
      if (value > 1) {
        str = '$k ($worth, x$v)';
      }
      gemsList.add(str);
    });

    return gemsList;
  }

  List<String> calculateArt(
      Treasures trObj, Treasures trObj2, bool isLegendary) {
    List<String> artList = [];
    readJsonArtItemsTable();
    getArtItemsObjectList();
    if (trObj.art == "0") {
      return artList;
    }
    Map<String, int> artMap = {};

    List<ArtItem> artByValueList = getArtByValue(trObj.artvalue.toString());
    List<String> parsedDice = DiceRoller.parseDiceText(trObj.art);

    int numberOfArts = DiceRoller.rollDiceAndSum(
        int.parse(parsedDice[0]), int.parse(parsedDice[1]));

    for (int i = 0; i < numberOfArts; i++) {
      String art = artByValueList[
              Utility.getRandomIndexFromListSize(artByValueList.length)]
          .artobject;
      artMap.update(art, (value) => ++value, ifAbsent: () => 1);
    }

    if (trObj2.art != "0" && isLegendary) {
      List<ArtItem> artByValueList = getArtByValue(trObj2.artvalue.toString());
      List<String> parsedDice = DiceRoller.parseDiceText(trObj2.art);
      int numberOfArts = DiceRoller.rollDiceAndSum(
          int.parse(parsedDice[0]), int.parse(parsedDice[1]));

      for (int i = 0; i < numberOfArts; i++) {
        String art = artByValueList[
                Utility.getRandomIndexFromListSize(artByValueList.length)]
            .artobject;
        artMap.update(art, (value) => ++value, ifAbsent: () => 1);
      }
    }

    artMap.forEach((key, value) {
      String k = key.toLowerCase();
      String v = value.toString();
      String worth = "${trObj.artvalue.toString()} gp";
      String str = '$k ($worth)';
      if (value > 1) {
        str = '$k ($worth, x$v)';
      }
      artList.add(str);
    });

    return artList;
  }

  List<ArtItem> getArtByValue(String value) {
    return artObjList.where((a) => a.value == value).toList();
  }

  List<String> calculateMagicItems(
      Treasures trObj, Treasures trObj2, bool isLegendary) {
    List<String> miList = [];
    readJsonMagicItemsTable();
    getMagicItemObjectList();

    Map<String, int> miMap = {};
    List<MagicItem> magicItemsByRank = [];

    if (trObj.magicitemtype != "0") {
      magicItemsByRank = getMagicItemsByRank(trObj.magicitemtype);
    }
    int numberOfMagicItems = 1;

    if (trObj.magicitems != "1" && trObj.magicitems != "0") {
      List<String> parsedDice = DiceRoller.parseDiceText(trObj.magicitems);

      numberOfMagicItems = DiceRoller.rollDiceAndSum(
          int.parse(parsedDice[0]), int.parse(parsedDice[1]));
    }

    for (int i = 0;
        magicItemsByRank.isNotEmpty && i < numberOfMagicItems;
        i++) {
      String magicItem = magicItemsByRank[
              Utility.getRandomIndexFromListSize(magicItemsByRank.length)]
          .magicitem;
      if (magicItem.contains("Spell Scroll")) {
        magicItem = mig5.randomizeScroll(magicItem);
      }
      miMap.update(magicItem, (value) => ++value, ifAbsent: () => 1);
    }

    //add legendary hoard
    int numberOfMagicItems2 = 0;
    if (isLegendary && trObj2.magicitems != "0") {
      numberOfMagicItems2 = 1;
      List<MagicItem> magicItemsByRank2 = [];

      if (trObj2.magicitemtype != "0") {
        magicItemsByRank2 = getMagicItemsByRank(trObj2.magicitemtype);
      }

      if (trObj2.magicitems != "1" && trObj2.magicitems != "0") {
        List<String> parsedDice = DiceRoller.parseDiceText(trObj2.magicitems);
        numberOfMagicItems2 = DiceRoller.rollDiceAndSum(
            int.parse(parsedDice[0]), int.parse(parsedDice[1]));
      }
      print(
          'magicItemsByRank: ${magicItemsByRank2.length}, ObjectMagicItems: ${trObj2.magicitems}');
      for (int i = 0;
          magicItemsByRank2.isNotEmpty && i < numberOfMagicItems2;
          i++) {
        String magicItem = magicItemsByRank2[
                Utility.getRandomIndexFromListSize(magicItemsByRank2.length)]
            .magicitem;
        miMap.update(magicItem, (value) => ++value, ifAbsent: () => 1);
      }
    }

    miMap.forEach((key, value) {
      String k = key;
      String v = value.toString();
      String str = '$k';
      if (value > 1) {
        str = '$k (x$v)';
      }
      miList.add(str);
    });

    return miList;
  }

  List<MagicItem> getMagicItemsByRank(String magicitemtype) {
    return magicItemObjList
        .where((mi) => mi.magictype == magicitemtype)
        .toList();
  }
}
