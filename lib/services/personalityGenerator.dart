import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:generator5e/services/utility.dart';

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
    if (background == null) {
      return personalityObjList;
    }
    return personalityObjList.where((p) => p.background == background).toList();
  }

  List<Personality> getTraitsByBackground(String? background) {
    if (background == null) {
      return personalityObjList
          .where((p) => p.characteristic == "Trait")
          .toList();
    }
    return personalityObjList
        .where((p) => p.background == background && p.characteristic == "Trait")
        .toList();
  }

  List<Personality> getBondsByBackground(String? background) {
    if (background == null) {
      return personalityObjList
          .where((p) => p.characteristic == "Bond")
          .toList();
    }
    return personalityObjList
        .where((p) => p.background == background && p.characteristic == "Bond")
        .toList();
  }

  List<Personality> getIdealsByBackground(String? background) {
    if (background == null) {
      return personalityObjList
          .where((p) => p.characteristic == "Ideal")
          .toList();
    }
    return personalityObjList
        .where((p) => p.background == background && p.characteristic == "Ideal")
        .toList();
  }

  List<Personality> getFlawsByBackground(String? background) {
    if (background == null) {
      return personalityObjList
          .where((p) => p.characteristic == "Flaw")
          .toList();
    }
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

  List<String> getAllBackgrounds() {
    List<String> backgroundList = [];
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

  List<String>? generateByBackground(String? background, String alignment) {
    List<String> ptList = [];
    String opposedAlignment = "(Never-Never)";

    if (alignment == "Good") {
      opposedAlignment = "(Evil)";
    } else if (alignment == "Evil") {
      opposedAlignment = "(Good)";
    }

    //get two traits
    List<Personality> traitsList = getTraitsByBackground(background!);

    Personality t1 =
        traitsList[Utility.getRandomIndexFromListSize(traitsList.length)];

    while (t1.description.contains(opposedAlignment)) {
      t1 = traitsList[Utility.getRandomIndexFromListSize(traitsList.length)];
    }

    Personality t2 =
        traitsList[Utility.getRandomIndexFromListSize(traitsList.length)];

    while (t1 == t2 || t2.description.contains(opposedAlignment)) {
      t2 = traitsList[Utility.getRandomIndexFromListSize(traitsList.length)];
    }

    ptList.add("Trait: ${t1.traitname}. ${t1.description}");
    ptList.add("Trait: ${t2.traitname}. ${t2.description}");

    //get ideal
    List<Personality> idealsList = getIdealsByBackground(background!);
    Personality ideal =
        idealsList[Utility.getRandomIndexFromListSize(idealsList.length)];

    while (ideal.description.contains(opposedAlignment)) {
      ideal = idealsList[Utility.getRandomIndexFromListSize(idealsList.length)];
    }

    ptList.add("Ideal: ${ideal.traitname}. ${ideal.description}");

    //get bond
    List<Personality> bondsList = getBondsByBackground(background!);
    Personality bond =
        bondsList[Utility.getRandomIndexFromListSize(bondsList.length)];

    while (bond.description.contains(opposedAlignment)) {
      bond = bondsList[Utility.getRandomIndexFromListSize(bondsList.length)];
    }
    ptList.add("Bond: ${bond.traitname}. ${bond.description}");

    //get flaw
    List<Personality> flawsList = getFlawsByBackground(background!);
    Personality flaw =
        flawsList[Utility.getRandomIndexFromListSize(flawsList.length)];

    while (flaw.description.contains(opposedAlignment)) {
      flaw = flawsList[Utility.getRandomIndexFromListSize(flawsList.length)];
    }

    ptList.add("Flaw: ${flaw.traitname}. ${flaw.description}");

    return ptList;
  }

  List<String>? generateUnabridged(String? background, String alignment) {
    List<String> ptList = [];
    String opposedAlignment = "(Never-Never)";

    if (alignment == "Good") {
      opposedAlignment = "(Evil)";
    } else if (alignment == "Evil") {
      opposedAlignment = "(Good)";
    }

    if (background == "Any Background") {
      List<String> backgrounds = getAllBackgrounds();
      String bk =
          backgrounds[Utility.getRandomIndexFromListSize(backgrounds.length)];
    }
    if (background == "Unabridged") {
      background = null;
    }

    //get two traits
    List<Personality> traitsList1 = getTraitsByBackground(background!);
    List<Personality> traitsList2 = getTraitsByBackground(background!);
    Personality t1 =
        traitsList1[Utility.getRandomIndexFromListSize(traitsList1.length)];

    while (t1.description.contains(opposedAlignment)) {
      t1 = traitsList1[Utility.getRandomIndexFromListSize(traitsList1.length)];
    }

    Personality t2 =
        traitsList2[Utility.getRandomIndexFromListSize(traitsList2.length)];

    while (t1 == t2 || t2.description.contains(opposedAlignment)) {
      t2 = traitsList2[Utility.getRandomIndexFromListSize(traitsList2.length)];
    }

    ptList.add("Trait: ${t1.traitname}. ${t1.description}");
    ptList.add("Trait: ${t2.traitname}. ${t2.description}");

    //get ideal
    List<Personality> idealsList = getIdealsByBackground(background!);
    Personality ideal =
        idealsList[Utility.getRandomIndexFromListSize(idealsList.length)];

    while (ideal.description.contains(opposedAlignment)) {
      ideal = idealsList[Utility.getRandomIndexFromListSize(idealsList.length)];
    }

    ptList.add("Ideal: ${ideal.traitname}. ${ideal.description}");

    //get bond
    List<Personality> bondsList = getBondsByBackground(background!);
    Personality bond =
        bondsList[Utility.getRandomIndexFromListSize(bondsList.length)];

    while (bond.description.contains(opposedAlignment)) {
      bond = bondsList[Utility.getRandomIndexFromListSize(bondsList.length)];
    }
    ptList.add("Bond: ${bond.traitname}. ${bond.description}");

    //get flaw
    List<Personality> flawsList = getFlawsByBackground(background!);
    Personality flaw =
        flawsList[Utility.getRandomIndexFromListSize(flawsList.length)];

    while (flaw.description.contains(opposedAlignment)) {
      flaw = flawsList[Utility.getRandomIndexFromListSize(flawsList.length)];
    }

    ptList.add("Flaw: ${flaw.traitname}. ${flaw.description}");

    return ptList;
  }
}
