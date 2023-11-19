import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:generator5e/models/magicitem.dart';
import 'package:generator5e/services/utility.dart';

import '../models/nameitem.dart';
import '../models/spell.dart';

class NameGenerator5e {
  List _nameitems = [];
  List<Name> namesObjList = [];
  bool _isLoaded = false;

  NameGenerator5e() {
    init();
  }

  Future<void> init() async {
    await readJsonNames();
    getNamesObjectList();
  }

  Future<void> readJsonNames() async {
    final String response =
        await rootBundle.loadString('assets/jsondata/names.json');
    final data = await json.decode(response);
    _nameitems = data["names"] as List;
  }

  getNamesObjectList() {
    namesObjList = _nameitems.map((mJson) => Name.fromJson(mJson)).toList();
  }

  List<Name> getAllNameItems() {
    return namesObjList;
  }

  Name getNameObjectByRace(String race) {
    if (race == "Any Race" || race == null) {
      return namesObjList[
          Utility.getRandomIndexFromListSize(namesObjList.length)];
    }
    return namesObjList.where((n) => n.race == race).toList()[0];
  }

  String generateName(String race, String gender) {
    Name nameObj = getNameObjectByRace(race);
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
    for (Name name in namesObjList) {
      if (!racesList.contains(name.race)) {
        racesList.add(name.race);
      }
    }
    return racesList;
  }
}
