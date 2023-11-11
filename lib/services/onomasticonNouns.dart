import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:generator5e/services/utility.dart';

import '../models/onoword.dart';

class OnomasticonNoun {
  List _nouns = [];
  List<OnoWord> nounObjList = [];
  bool _isLoaded = false;

  OnomasticonNoun() {
    readJsonOnomasticon().then((_) {
      _isLoaded = true;
      getNounObjectList();
    });
  }

  bool isLoaded() {
    return _isLoaded;
  }

  Future<void> readJsonOnomasticon() async {
    final String response =
        await rootBundle.loadString('assets/onomasticon/nouns.json');
    final data = await json.decode(response);
    _nouns = data["nouns"] as List;
  }

  getNounObjectList() {
    nounObjList =
        _nouns.map<OnoWord>((oJson) => OnoWord.fromJson(oJson)).toList();
  }

  List getSynonyms(String word) {
    List<OnoWord> objList =
        nounObjList.where((desc) => desc.word == word).toList();
    return objList[0].synonyms;
  }

  String pickWordFromSynonyms(String word) {
    List wordList = getSynonyms(word);
    int i = Utility.getRandomIndexFromListSize(wordList.length);
    return wordList[i];
  }

  String ancient() {
    return pickWordFromSynonyms("ancient");
  }

  String armorMetal() {
    return pickWordFromSynonyms("armorMetal");
  }

  String assortment() {
    return pickWordFromSynonyms("collection");
  }

  String beastAmphibian() {
    return pickWordFromSynonyms("amphibianBeast");
  }

  String beastApeMonkey() {
    return pickWordFromSynonyms("apeMonkeyBeast");
  }

  String beastArachnid() {
    return pickWordFromSynonyms("arachnidBeast");
  }

  String beastBird() {
    return pickWordFromSynonyms("birdBeast");
  }

  String beastDinosaur() {
    return pickWordFromSynonyms("dinosaurBeast");
  }

  String beastIceAge() {
    return pickWordFromSynonyms("iceAgeBeast");
  }

  String beastInsect() {
    return pickWordFromSynonyms("insectBeast");
  }

  String beastMammalMild() {
    return pickWordFromSynonyms("mammalMildBeast");
  }

  String beastMammalFierce() {
    return pickWordFromSynonyms("mammalFierceBeast");
  }

  String beastReptile() {
    return pickWordFromSynonyms("reptileBeast");
  }

  String beastSea() {
    return pickWordFromSynonyms("seaBeast");
  }

  String book() {
    return pickWordFromSynonyms("book");
  }

  String coin() {
    return pickWordFromSynonyms("coin");
  }

  String darkPlaces() {
    return pickWordFromSynonyms("darkPlaces");
  }

  String document() {
    return pickWordFromSynonyms("document");
  }

  String dream() {
    return pickWordFromSynonyms("dream");
  }

  String game() {
    return pickWordFromSynonyms("game");
  }

  String humanoid() {
    return pickWordFromSynonyms("humanoid");
  }

  String humanoidPart() {
    return pickWordFromSynonyms("humanoidPart");
  }

  String idol() {
    return pickWordFromSynonyms("idol");
  }

  String jewelry() {
    return pickWordFromSynonyms("jewelry");
  }

  String journal() {
    return pickWordFromSynonyms("journal");
  }

  String kingdom() {
    return pickWordFromSynonyms("kingdom");
  }

  String language() {
    return pickWordFromSynonyms("language");
  }

  String metalAll() {
    return pickWordFromSynonyms("allMetal");
  }

  String metalPrecious() {
    return pickWordFromSynonyms("preciousMetal");
  }

  String mineral() {
    return pickWordFromSynonyms("mineral");
  }

  String monsterTerror() {
    return pickWordFromSynonyms("monsterTerror");
  }

  String monsterType() {
    return pickWordFromSynonyms("monsterType");
  }

  String aberration() {
    return pickWordFromSynonyms("aberration");
  }

  String dragon() {
    return pickWordFromSynonyms("dragon");
  }

  String parcel() {
    return pickWordFromSynonyms("parcel");
  }

  String rockPiece() {
    return pickWordFromSynonyms("rockPiece");
  }

  String scholarItem() {
    return pickWordFromSynonyms("scholarItem");
  }

  String symbol() {
    return pickWordFromSynonyms("symbol");
  }

  String symbolOminous() {
    return pickWordFromSynonyms("symbolOminous");
  }

  String textile() {
    return pickWordFromSynonyms("textile");
  }

  String thingsInPairs() {
    return pickWordFromSynonyms("thingsInPairs");
  }

  String soldier() {
    return pickWordFromSynonyms("soldier");
  }

  String weaponMelee() {
    return pickWordFromSynonyms("weaponMelee");
  }

  String weaponRanged() {
    return pickWordFromSynonyms("weaponRanged");
  }

  String ammunitionAndThrown() {
    return pickWordFromSynonyms("ammunitionAndThrown");
  }

  String ammunition() {
    return pickWordFromSynonyms("ammunition");
  }

  String pirate() {
    return pickWordFromSynonyms("pirate");
  }

  String heroesAndVillains() {
    return pickWordFromSynonyms("heroesAndVillains");
  }

  String classesBase() {
    return pickWordFromSynonyms("classesBase");
  }

  String classesCaster() {
    return pickWordFromSynonyms("classesCaster");
  }

  String container() {
    return pickWordFromSynonyms("container");
  }

  String remains() {
    return pickWordFromSynonyms("remains");
  }

  String familyMember() {
    return pickWordFromSynonyms("familyMember");
  }

  String armorPiece() {
    return pickWordFromSynonyms("armorPiece");
  }

  String patrol() {
    return pickWordFromSynonyms("patrol");
  }

  String artStyle() {
    return pickWordFromSynonyms("artStyle");
  }

  String toolSmall() {
    return pickWordFromSynonyms("toolSmall");
  }

  String toyMedieval() {
    return pickWordFromSynonyms("toyMedieval");
  }

  String itemsMacabre() {
    return pickWordFromSynonyms("itemsMacabre");
  }

  String humanoidTiny() {
    return pickWordFromSynonyms("humanoidTiny");
  }

  String beastSmall() {
    return pickWordFromSynonyms("beastSmall");
  }

  String wizardTraditions() {
    return pickWordFromSynonyms("wizardTraditions");
  }

  String itemsArtistic() {
    return pickWordFromSynonyms("itemsArtistic");
  }

  String gemPrecious() {
    return pickWordFromSynonyms("gemPrecious");
  }

  String lightSource() {
    return pickWordFromSynonyms("lightSource");
  }

  String bag() {
    return pickWordFromSynonyms("bag");
  }

  String powder() {
    return pickWordFromSynonyms("powder");
  }

  String symbolMagic() {
    return pickWordFromSynonyms("symbolMagic");
  }

  String neckwear() {
    return pickWordFromSynonyms("neckwear");
  }

  String itemClothing() {
    return pickWordFromSynonyms("itemClothing");
  }

  String potion() {
    return pickWordFromSynonyms("potion");
  }

  String monstrosity() {
    return pickWordFromSynonyms("monstrosity");
  }

  String ingredients() {
    return pickWordFromSynonyms("ingredients");
  }

}
