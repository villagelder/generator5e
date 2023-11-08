import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:generator5e/services/utility.dart';

import '../models/onoword.dart';

class OnomasticonVerb {
  List _verbs = [];
  List<OnoWord> verbsObjList = [];

  OnomasticonVerb() {
    readJsonOnomasticon();
    getNounsObjectList();
  }

  Future<void> readJsonOnomasticon() async {
    final String response =
        await rootBundle.loadString('assets/onomasticon/verbs.json');
    final data = await json.decode(response);
    _verbs = data["verbs"] as List;
  }

  getNounsObjectList() {
    verbsObjList = _verbs.map((oJson) => OnoWord.fromJson(oJson)).toList();
  }

  List? getSynonyms(String word) {
    List<OnoWord> objList =
        verbsObjList.where((noun) => noun.word == word).toList();
    return objList[0].synonyms;
  }

  String pickWordFromSynonyms(String word) {
    List? wordList = getSynonyms(word);
    int i = Utility.getRandomIndexFromListSize(wordList!.length);
    return wordList[i];
  }

  String ping() {
    return pickWordFromSynonyms("ping");
  }

  String mint() {
    return pickWordFromSynonyms("mint");
  }

  String forge() {
    return pickWordFromSynonyms("forge");
  }
}
