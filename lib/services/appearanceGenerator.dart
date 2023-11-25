import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:generator5e/models/appearanceitem.dart';
import 'package:generator5e/services/diceRoller.dart';
import 'package:collection/collection.dart';
import 'package:generator5e/services/utility.dart';

class AbilityScoreGenerator {
  List _appearanceitems = [];
  List<AppearanceItem> appearanceObjList = [];
  bool _isLoaded = false;

  AbilityScoreGenerator() {
    init();
  }

  Future<void> init() async {
    await readJsonAppearances();
    getAppearanceObjectList();
  }

  Future<void> readJsonAppearances() async {
    final String response =
    await rootBundle.loadString('assets/jsondata/appearance.json');
    final data = await json.decode(response);
    _appearanceitems = data["appearance"] as List;
  }

  getAppearanceObjectList() {
    appearanceObjList = _appearanceitems.map((aJson) => AppearanceItem.fromJson(aJson)).toList();
  }

  List<AppearanceItem> getAllAppearancesItems() {
    return appearanceObjList;
  }

  AppearanceItem getAppearanceObjectByRace(String race) {
    if (race == "Any Race" || race == null) {
      return appearanceObjList[
      Utility.getRandomIndexFromListSize(appearanceObjList.length)];
    }
    return appearanceObjList.where((n) => n.race == race).toList()[0];
  }

  String generateName(String race, String gender) {
    AppearanceItem appObj = getNameObjectByRace(race);
    List<String> firstNamesList = [];
    List<String>? lastNamesList = nameObj.lastNames;
    List<String>? nicknamesList = nameObj.thirdNames;
    String lastName = "";
    String? moniker = nameObj.moniker;

    if (gender == "Male") {
      firstNamesList = nameObj.maleFirstNames;
    } else if (gender == "Female") {
      firstNamesList = nameObj.femaleFirstNames;
    } else {
      firstNamesList = nameObj.maleFirstNames;
      firstNamesList.addAll(nameObj.femaleFirstNames);
    }

    String firstName = firstNamesList[
    Utility.getRandomIndexFromListSize(firstNamesList.length)];
    if (lastNamesList.isNotEmpty) {
      lastName = lastNamesList[
      Utility.getRandomIndexFromListSize(lastNamesList.length)];
    }
    if (nicknamesList!.isNotEmpty) {
      String nickname = nicknamesList[
      Utility.getRandomIndexFromListSize(nicknamesList.length)];

      if (lastNamesList.isEmpty) {
        return "$firstName -- $moniker: $nickname";
      }
      return "$firstName $lastName -- $moniker: $nickname";
    }

    if (lastNamesList.isEmpty) {
      return firstName;
    }

    return "$firstName $lastName";
  }

  List<String> generateNames(String race, String gender, int num) {
    List<String> namesList = [];

    for (int i = 0; i < num; i++) {
      namesList.add(generateName(race, gender));
    }
    return namesList;
  }

  Future<List<String>> getRacesWithNames() async {
    if (!_isLoaded) {
      await init();
    }

    List<String> racesList = ['Any Race'];
    for (Name name in appearanceObjList) {
      if (!racesList.contains(name.race)) {
        racesList.add(name.race);
      }
    }
    return racesList;
  }
}
