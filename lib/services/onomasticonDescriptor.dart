import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:generator5e/models/onoword.dart';
import 'package:generator5e/services/utility.dart';

class OnomasticonDescriptor {
  List _descriptors = [];
  List<OnoWord> descObjList = [];
  bool _isLoaded = false;

  bool isLoaded() {
    return _isLoaded;
  }

  OnomasticonDescriptor() {
    readJsonOnomasticon().then((_) => _isLoaded = true);
    getDescriptorObjectList();
  }

  Future<void> readJsonOnomasticon() async {
    String response =
        await rootBundle.loadString('assets/onomasticon/descriptors.json');
    final data = await json.decode(response);
    _descriptors = data['descriptors'] as List;
  }

  void getDescriptorObjectList() {
    try {
      descObjList = _descriptors
          .map((oJson) => OnoWord.fromJson(oJson as Map<String, dynamic>))
          .toList();
    } catch (err) {
      print('Error creating OnoWord list: $err');
    }
  }

  String pickWordFromSynonyms(String word) {
    List? wordList = getSynonyms(word);
    int i = Utility.getRandomIndexFromListSize(wordList!.length);
    return wordList[i];
  }

  List? getSynonyms(String word) {
    List<OnoWord> objList =
        descObjList.where((noun) => noun.word == word).toList();
    return objList[0].synonyms;
  }

  String macabre() {
    return pickWordFromSynonyms("macabre");
  }

  String foreign() {
    return pickWordFromSynonyms("foreign");
  }
}
