import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:generator5e/services/utility.dart';

import '../models/onoword.dart';

class Onomasticon {
  List _nouns = [];
  List<OnoWord> nounsObjList = [];
  List<OnoWord> tempNounsList = [];
  List<String> amphibianBeast = [];

  Onomasticon() {
    readJsonOnomasticon();
    getNounsObjectList();
    getAmphibianBeast();
  }

  int roll = 0;

  Future<void> readJsonOnomasticon() async {
    final String response =
        await rootBundle.loadString('assets/onomasticon/nouns.json');
    final data = await json.decode(response);
    _nouns = data["treasures"] as List;
  }

  getNounsObjectList() {
    nounsObjList = _nouns.map((oJson) => OnoWord.fromJson(oJson)).toList();
  }

  List<String> getSynonyms(String word) {
    OnoWord wordObj =
        nounsObjList.where((noun) => noun.type == word) as OnoWord;
    return wordObj.elements;
  }

  getAmphibianBeast() {
    amphibianBeast = pickWordFromSynonyms("amphibianBeast") as List<String>;
  }

  String pickWordFromSynonyms(String word) {
    List<String> wordList = getSynonyms(word);
    int i = Utility.getRandomIndexFromListSize(wordList.length);
    return wordList[i];
  }
}
