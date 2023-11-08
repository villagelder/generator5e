import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:generator5e/services/utility.dart';

import '../models/onoword.dart';

class OnomasticonDescriptor {
  List _descriptors = [];
  List<OnoWord> descObjList = [];

  OnomasticonDescriptor() {
    readJsonOnomasticon();
    getDescObjectList();
  }

  Future<void> readJsonOnomasticon() async {
    final String response =
        await rootBundle.loadString('assets/onomasticon/descriptors.json');
    final data = await json.decode(response);
    _descriptors = data["descriptors"] as List;
  }

  getDescObjectList() {
    descObjList = _descriptors.map((oJson) => OnoWord.fromJson(oJson)).toList();
  }

  List getSynonyms(String word) {
    List<OnoWord> objList =
        descObjList.where((desc) => desc.type == word).toList();
    return objList[0].synonyms;
  }

  String pickWordFromSynonyms(String word) {
    List wordList = getSynonyms(word);
    int i = Utility.getRandomIndexFromListSize(wordList!.length);
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
}
