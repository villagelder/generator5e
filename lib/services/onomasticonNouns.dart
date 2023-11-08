import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:generator5e/services/utility.dart';

import '../models/onoword.dart';

class OnomasticonNoun {
  List _nouns = [];
  List<OnoWord> nounsObjList = [];

  OnomasticonNoun() {
    readJsonOnomasticon();
    getNounsObjectList();
  }

  Future<void> readJsonOnomasticon() async {
    final String response =
        await rootBundle.loadString('assets/onomasticon/nouns.json');
    final data = await json.decode(response);
    _nouns = data["nouns"] as List;
  }

  getNounsObjectList() {
    nounsObjList = _nouns.map((oJson) => OnoWord.fromJson(oJson)).toList();
  }

  String pickWordFromSynonyms(String word) {
    List? wordList = getSynonyms(word);
    int i = Utility.getRandomIndexFromListSize(wordList!.length);
    return wordList[i];
  }

  List? getSynonyms(String word) {
    List<OnoWord> objList =
        nounsObjList.where((noun) => noun.word == word).toList();
    return objList[0].synonyms;
  }

  String beastAmphibian() {
    return pickWordFromSynonyms("amphibianBeast");
  }

  String humanoid() {
    return pickWordFromSynonyms("humanoid");
  }

  String humanoidPart() {
    return pickWordFromSynonyms("humanoidPart");
  }

  String mineral() {
    return pickWordFromSynonyms("mineral");
  }

  String rockPiece() {
    return pickWordFromSynonyms("rockPiece");
  }

  String preciousMetal() {
    return pickWordFromSynonyms("preciousMetal");
  }

  String idol() {
    return pickWordFromSynonyms("idol");
  }

  String kingdom() {
    return pickWordFromSynonyms("kingdom");
  }

  String darkPlace() {
    return pickWordFromSynonyms("darkPlace");
  }

  String armorMetal() {
    return pickWordFromSynonyms("armorMetal");
  }

  String game() {
    return pickWordFromSynonyms("game");
  }

  String scholarItem() {
    return pickWordFromSynonyms("scholarItem");
  }

  String jewelry() {
    return pickWordFromSynonyms("jewelry");
  }

  String coin() {
    return pickWordFromSynonyms("coin");
  }

  String monster() {
    return pickWordFromSynonyms("monster");
  }

  String material() {
    return pickWordFromSynonyms("material");
  }

  String dream() {
    return pickWordFromSynonyms("dream");
  }

  String document() {
    return pickWordFromSynonyms("document");
  }

  String allMetal() {
    return pickWordFromSynonyms("allMetal");
  }

  String book() {
    return pickWordFromSynonyms("book");
  }

  String journal() {
    return pickWordFromSynonyms("journal");
  }

  String ancient() {
    return pickWordFromSynonyms("ancient");
  }

  String assortment() {
    return pickWordFromSynonyms("collection");
  }

  String symbol() {
    return pickWordFromSynonyms("symbol");
  }

  String dragon() {
    return pickWordFromSynonyms("dragon");
  }

  String aberration() {
    return pickWordFromSynonyms("aberration");
  }

  String beastBird() {
    return pickWordFromSynonyms("birdBeast");
  }

  String beastDinosaur() {
    return pickWordFromSynonyms("dinosaurBeast");
  }

  String beastMammalMild() {
    return pickWordFromSynonyms("mammalMildBeast");
  }

  String beastMammalFierce() {
    return pickWordFromSynonyms("mammalFierceBeast");
  }

  String beastApeMonkey() {
    return pickWordFromSynonyms("apeMonkeyBeast");
  }

  String beastIceAge() {
    return pickWordFromSynonyms("iceAgeBeast");
  }

  String beastReptile() {
    return pickWordFromSynonyms("reptileBeast");
  }

  String beastInsct() {
    return pickWordFromSynonyms("insectBeast");
  }

  String beastArachnid() {
    return pickWordFromSynonyms("arachnidBeast");
  }

  String beastSea() {
    return pickWordFromSynonyms("seaBeast");
  }
}
