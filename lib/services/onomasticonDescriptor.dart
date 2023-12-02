import 'dart:convert';
import 'dart:core';

import 'package:flutter/services.dart';
import 'package:generator5e/services/utility.dart';

import '../models/onoword.dart';

class OnomasticonDescriptor {
  List _descriptors = [];
  List<OnoWord> descObjList = [];
  bool _isLoaded = false;

  OnomasticonDescriptor() {
    readJsonOnomasticon().then((_) {
      _isLoaded = true;
      getDescObjectList();
    });
  }

  bool isLoaded() {
    return _isLoaded;
  }

  Future<void> readJsonOnomasticon() async {
    final String response =
        await rootBundle.loadString('assets/onomasticon/descriptors.json');
    final data = await json.decode(response);
    _descriptors = data["descriptors"] as List;
  }

  getDescObjectList() {
    descObjList =
        _descriptors.map<OnoWord>((oJson) => OnoWord.fromJson(oJson)).toList();
  }

  List getSynonyms(String word) {
    List<OnoWord> objList =
        descObjList.where((desc) => desc.word == word).toList();
    return objList[0].synonyms;
  }

  String pickWordFromSynonyms(String word) {
    List wordList = getSynonyms(word);
    int i = Utility.getRandomIndexFromListSize(wordList.length);
    return wordList[i];
  }

  String macabre() {
    return pickWordFromSynonyms("macabre");
  }

  String foreign() {
    return pickWordFromSynonyms("foreign");
  }

  String scary() {
    return pickWordFromSynonyms("scary");
  }

  String ancient() {
    return pickWordFromSynonyms("ancient");
  }

  String weak() {
    return pickWordFromSynonyms("weak");
  }

  String average() {
    return pickWordFromSynonyms("average");
  }

  String glistening() {
    return pickWordFromSynonyms("glistening");
  }

  String childlike() {
    return pickWordFromSynonyms("childlike");
  }

  String lostInBattle() {
    return pickWordFromSynonyms("lostInBattle");
  }

  String ornate() {
    return pickWordFromSynonyms("ornate");
  }

  String colorsBase() {
    return pickWordFromSynonyms("colorsBase");
  }

  String material() {
    return pickWordFromSynonyms("material");
  }

  String gravelyIll() {
    return pickWordFromSynonyms("gravelyIll");
  }

  String kindly() {
    return pickWordFromSynonyms("kindly");
  }

  String weird() {
    return pickWordFromSynonyms("weird");
  }

  String feelsLike() {
    return pickWordFromSynonyms("feelsLike");
  }

  String geometric() {
    return pickWordFromSynonyms("geometric");
  }

  String itemType() {
    return pickWordFromSynonyms("itemType");
  }

  String hornShape() {
    return pickWordFromSynonyms("hornShapes");
  }

  String hornDescriptor() {
    return pickWordFromSynonyms("hornDescriptors");
  }

  /*This method uses a base word to pick another, more specific word,
  eg. baseColor => white => vanilla
   */
  String variantFromBase(String baseWord) {
    return pickWordFromSynonyms(baseWord);
  }

  String muscular() {
    return pickWordFromSynonyms("muscular");
  }

  String agile() {
    return pickWordFromSynonyms("agile");
  }

  String thin() {
    return pickWordFromSynonyms("thin");
  }

  String hefty() {
    return pickWordFromSynonyms("hefty");
  }

  String attractive() {
    return pickWordFromSynonyms("attractive");
  }

  String unattractive() {
    return pickWordFromSynonyms("unattractive");
  }

  String earsSmallDescription() {
    return pickWordFromSynonyms("earsSmallDesc");
  }

  String earsBigDescription() {
    return pickWordFromSynonyms("earsBigDesc");
  }

  String eyesDescription() {
    return pickWordFromSynonyms("eyesDesc");
  }

  String colorDescription() {
    return pickWordFromSynonyms("colorDesc");
  }

  String skinOrHairColorDescription() {
    return pickWordFromSynonyms("skinHairDesc");
  }

  String metallic() {
    return pickWordFromSynonyms("metallic");
  }

  String beige() {
    String color = pickWordFromSynonyms("beige");
    if (!color.contains("beige")) {
      return "$color beige";
    }
    return color;
  }

  String white() {
    String color = pickWordFromSynonyms("white");
    if (!color.contains("white")) {
      return "$color white";
    }
    return color;
  }

  String gray() {
    String color = pickWordFromSynonyms("gray");
    if (!color.contains("gray")) {
      return "$color gray";
    }
    return color;
  }

  String black() {
    String color = pickWordFromSynonyms("black");
    if (!color.contains("black")) {
      return "$color black";
    }
    return color;
  }

  String blonde() {
    String color = pickWordFromSynonyms("blonde");
    if (!color.contains("blonde")) {
      return "$color blonde";
    }
    return color;
  }

  String brown() {
    String color = pickWordFromSynonyms("brown");
    if (!color.contains("brown")) {
      return "$color brown";
    }
    return color;
  }

  String blue() {
    String color = pickWordFromSynonyms("blue");
    if (!color.contains("blue")) {
      return "$color blue";
    }
    return color;
  }

  String red() {
    String color = pickWordFromSynonyms("red");
    if (!color.contains("red")) {
      return "$color red";
    }
    return color;
  }

  String pink() {
    String color = pickWordFromSynonyms("pink");
    if (!color.contains("pink")) {
      return "$color pink";
    }
    return color;
  }

  String green() {
    String color = pickWordFromSynonyms("green");
    if (!color.contains("green")) {
      return "$color green";
    }
    return color;
  }

  String yellow() {
    String color = pickWordFromSynonyms("yellow");
    if (!color.contains("yellow")) {
      return "$color yellow";
    }
    return color;
  }

  String orange() {
    String color = pickWordFromSynonyms("orange");
    if (!color.contains("orange")) {
      return "$color orange";
    }
    return color;
  }

  String violet() {
    String color = pickWordFromSynonyms("violet");
    if (!color.contains("violet")) {
      return "$color violet";
    }
    return color;
  }

  String gold() {
    return pickWordFromSynonyms("gold");
  }

  String platinum() {
    return pickWordFromSynonyms("platinum");
  }

  String electrum() {
    return pickWordFromSynonyms("electrum");
  }

  String copper() {
    return pickWordFromSynonyms("copper");
  }

  String bronze() {
    return pickWordFromSynonyms("bronze");
  }

  String brass() {
    return pickWordFromSynonyms("brass");
  }

  String silver() {
    return pickWordFromSynonyms("silver");
  }

  String hairstyles() {
    return pickWordFromSynonyms("hairstyles");
  }

  String faceShape() {
    return pickWordFromSynonyms("faceShape");
  }

  String scarShape() {
    return pickWordFromSynonyms("scarShape");
  }

  String residual() {
    return pickWordFromSynonyms("residual");
  }

  List<String> biColorsBase() {
    List<String> colors = [];
    colors.add(colorsBase());

    String color2 = colorsBase();
    while (colors.contains(color2)) {
      color2 = colorsBase();
    }

    colors.add(color2);

    return colors;
  }

  List<String> biColorsDetailed() {
    List<String> colors = [];

    String color1 = colorsBase();
    String color2 = colorsBase();

    while (color1 == color2) {
      color2 = colorsBase();
    }

    colors.add(variantFromBase(color1));
    colors.add(variantFromBase(color2));
    return colors;
  }
}
