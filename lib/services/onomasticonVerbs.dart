import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:generator5e/services/utility.dart';

import '../models/onoword.dart';

class OnomasticonVerb {
  List _verbs = [];
  List<OnoWord> verbObjList = [];
  bool _isLoaded = false;

  OnomasticonVerb() {
    readJsonOnomasticon().then((_) {
      _isLoaded = true;
      getVerbObjectList();
    });
  }

  bool isLoaded() {
    return _isLoaded;
  }

  Future<void> readJsonOnomasticon() async {
    final String response =
        await rootBundle.loadString('assets/onomasticon/verbs.json');
    final data = await json.decode(response);
    _verbs = data["verbs"] as List;
  }

  getVerbObjectList() {
    verbObjList =
        _verbs.map<OnoWord>((oJson) => OnoWord.fromJson(oJson)).toList();
  }

  List getSynonyms(String word) {
    List<OnoWord> objList =
        verbObjList.where((desc) => desc.word == word).toList();
    return objList[0].synonyms;
  }

  String pickWordFromSynonyms(String word) {
    List wordList = getSynonyms(word);
    int i = Utility.getRandomIndexFromListSize(wordList.length);
    return wordList[i];
  }

  String corrode() {
    return pickWordFromSynonyms("corrode");
  }

  String dangle() {
    return pickWordFromSynonyms("dangle");
  }

  String depict() {
    return pickWordFromSynonyms("depict");
  }

  String forge() {
    return pickWordFromSynonyms("forge");
  }

  String ping() {
    return pickWordFromSynonyms("ping");
  }

  String mint() {
    return pickWordFromSynonyms("mint");
  }

  String understand() {
    return pickWordFromSynonyms("understand");
  }

  String inscribe() {
    return pickWordFromSynonyms("inscribe");
  }

  String actionSimple() {
    return pickWordFromSynonyms("actionSimple");
  }

  String actionBig() {
    return pickWordFromSynonyms("actionBig");
  }

}
