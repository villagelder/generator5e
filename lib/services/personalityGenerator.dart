import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/personality.dart';

class PersonalityGenerator {
  List _personalityItems = [];
  List<Personality> personalityObjList = [];
  bool _isLoaded = false;

  PersonalityGenerator() {
    init();
  }

  Future<void> init() async {
    await readJsonPersonalities();
    getPersonalityObjectList();
  }

  Future<void> readJsonPersonalities() async {
    final String response =
        await rootBundle.loadString('assets/jsondata/personality.json');
    final data = await json.decode(response);
    _personalityItems = data["personalities"] as List;
  }

  getPersonalityObjectList() {
    personalityObjList =
        _personalityItems.map((tJson) => Personality.fromJson(tJson)).toList();
  }

  List<Personality> getPersonalityByBackground(String background) {
    return personalityObjList.where((p) => p.background == background).toList();
  }

  List<Personality> getTraitsByBackground(String background) {
    return personalityObjList
        .where((p) => p.background == background && p.characteristic == "Trait")
        .toList();
  }

  List<Personality> getBondsByBackground(String background) {
    return personalityObjList
        .where((p) => p.background == background && p.characteristic == "Bond")
        .toList();
  }

  List<Personality> getIdealsByBackground(String background) {
    return personalityObjList
        .where((p) => p.background == background && p.characteristic == "Ideal")
        .toList();
  }

  List<Personality> getFlawsByBackground(String background) {
    return personalityObjList
        .where((p) => p.background == background && p.characteristic == "Flaw")
        .toList();
  }

  Future<List<String>> getBackgroundList() async {
    if (!_isLoaded) {
      await init();
    }

    List<String> backgroundList = ['Any Background'];
    for (Personality personality in personalityObjList) {
      if (!backgroundList.contains(personality.background)) {
        backgroundList.add(personality.background);
      }
    }
    return backgroundList;
  }

  List<Personality> getAllTraits() {
    return personalityObjList
        .where((p) => p.characteristic == "Trait")
        .toList();
  }

  List<Personality> getAllFlaws() {
    return personalityObjList.where((p) => p.characteristic == "Flaw").toList();
  }

  List<Personality> getAllIdeals() {
    return personalityObjList
        .where((p) => p.characteristic == "Ideal")
        .toList();
  }

  List<Personality> getAllBonds() {
    return personalityObjList.where((p) => p.characteristic == "Bond").toList();
  }

  List<String> generate(String background, String alignment) {
    List<String> ptList = [];
    if (background == "Any Background") {
    } else {}
  }
}
